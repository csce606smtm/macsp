class AdminSetup::ContestController < ApplicationController
    skip_before_action :require_login

    def new
        @contest = Contest.new
        @division = Division.new
        
        @cList  = []
        
        @contest_all = Contest.all
        @division_all = Division.all
        
        @division_all.each do |division|
          @contest_all.each do |contest|
            
            if division.contest_id == contest.id
              cnt = 0
              cid_list = User.joins(:judges).pluck_to_hash(:contest_id) 
              
              cid_list.each do |cid|
                if (cid[:contest_id] == contest.id)
                  cnt = cnt + 1
                end
              end
              
              cnt_a = 0
              did_list = Division.joins(:auctioneers).pluck_to_hash(:contest_id, :user_id, :division_id) 
              
              did_list.each do |did|
                if (did[:contest_id] == contest.id)
                  cnt_a = cnt_a + 1
                end
              end
              
              data = {}
              data[:id] = contest.id
              data[:division_id] = division.id
              data[:contest_name] = contest.contest_name
              data[:division_name] = division.division_name
              data[:round] = division.round
              data[:num_judge] = cnt
              data[:num_auctioneer] = cnt_a
            
              @cList << data
            end
          end
        end
    end

    def index
      @contests = Contest.all
    end
    
    def create
        #@contest = Contest.find_by :params[:contest][:contest_name]
        
        parser = DivisionParser.new(params[:division][:division_name])
        if parser.parse_input_string
          #do nothing
        else
          flash[:failure] = "Input Error"
          redirect_to new_admin_setup_contest_path and return
        end
        rounds = parser.rounds
        
        @contest = Contest.new(contest_params) #moved here in case of error during parsing
        if @contest.save
            flash[:success] = 'Successfully added contest'
        end
        
        rounds.each do |round|
            @division = Division.new(:division_name => round[0],
                                     :round => round[1],
                                     :contest_id => @contest.id)
            if @division.save
                flash[:success] = 'Successfully added division'
                
                Qsheet.create!(:division_id => @division.id)
            end
        end
        
        redirect_to new_admin_setup_contest_path
    end

    def destroy
        @division = Division.find params[:division_id]
        #@new_judge = Judge.find_by(user_id: @judge.id)
        
        @temp_contest_id = @division.contest_id
        @temp_division_id = @division.id
        
        @division.destroy
        #@new_judge.destroy
        
        @temp = Division.find_by(contest_id: @temp_contest_id)
        
        if @temp == nil
          @contest = Contest.find_by(id: @temp_contest_id)
          @contest.destroy
        end
        
        @temp_qsheet = Qsheet.find_by(division_id: @temp_division_id)
        
        @temp_questions = Question.find_by(qsheet_id: @temp_qsheet.id)
        
        if @temp_questions != nil
          @temp_questions.destroy
        end
        
        if @temp_qsheet != nil
          @temp_qsheet.destroy
        end
        
        flash[:notice] = "Division #{@division.division_name} deleted"
        redirect_to new_admin_setup_contest_path
    end
  
  private

    def contest_params
        params.require(:contest).permit(:contest_name, :start_date, :end_date)
    end
    
    def division_params
        params.require(:division).permit(:division_name)
    end
    
    def user_params
        #params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

end



class String
  def is_letter?
    self =~ /[[:alpha:]]/
  end
  
  def is_number?
    self =~ /[[:digit:]]/
  end  
end

class DivisionParser
    
    #by no means in its final state, merely dumped into this file
  def initialize(input_string)
    @input_string = input_string
  end
  
  def parse_input_string
    
    if @input_string.is_a? String
      #nothing happens
    else
      return false
    end
    
    if @input_string.count(":") == 0
      return false
    end
    
    num_rounds = 0
    @input_string.each_char do |z|
      if z.is_number?
        num_rounds += z.to_i
      end
    end
    
    i = 0
    j = 0
    parsed_string = String.new
    parsed_number = String.new
    @rounds_array = Array.new(num_rounds){Array.new(2)}
    while @input_string[i] != nil
    
      if @input_string[i].is_letter?
        parsed_string << @input_string[i]
        
      elsif @input_string[i] == ":"
        i += 1
        
        while @input_string[i].is_number?
          parsed_number << @input_string[i]
          
          if @input_string[i+1] == nil
            i += 1
            break
          end
          
          i += 1
        end
        
        if parsed_number == nil
          return false
        end
        
        parsed_number = parsed_number.to_i
        for k in 1..parsed_number
          @rounds_array[j][0] = parsed_string
          @rounds_array[j][1] = k.to_s
          j += 1
        end
        
        if @input_string[i] != "," and @input_string[i] != nil
          return false
        end
        i += 1
        
        parsed_string = String.new
        parsed_number = String.new
        
      elsif @input_string[i] == " "
        if @input_string[i-1] != ","
          parsed_string << @input_string[i]
        end
        
      else
        return false
      end
      
      i += 1
    end
    
    return true
  end
  
  def rounds
    @rounds_array
  end
  
end