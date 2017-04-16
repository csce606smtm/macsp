class AdminSetup::ContestController < ApplicationController
    skip_before_action :require_login

    def new
        @contest = Contest.new
        @division = Division.new
        
        @dList = Division.all
    end

    def index
    end
    def create
        @contest = Contest.new(contest_params)
        if @contest.save
            flash[:success] = 'Successfully added contest'
        end
       
        #@contest = Contest.find_by :params[:contest][:name]
        
        
        parser = DivisionParser.new(params[:division][:name])
        parser.parse_input_string
        rounds = parser.rounds
        
        rounds.each do |round|
            @division = Division.new(:name => round[0],
                                     :round => round[1],
                                     :c_id => @contest.id)
            if @division.save
                flash[:success] = 'Successfully added division'
            end
        end
        
        redirect_to new_admin_setup_contest_path
    end

    def destroy
        
    end

  private

    def contest_params
        params.require(:contest).permit(:name, :start_date, :end_date)
    end
    
    def division_params
        params.require(:division).permit(:name)
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
    #@input_string = "Rookie:1, Veteran:3, Wood League:5"
    @input_string = input_string
  end
  
  def parse_input_string
    
    if @input_string.is_a? String
      #nothing happens
    else
      raise "Input is not a string"
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
        #parsed_string << " Round "
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
          raise "Input is missing the number of rounds"
        end
        
        parsed_number = parsed_number.to_i
        for k in 1..parsed_number
          @rounds_array[j][0] = parsed_string
          @rounds_array[j][1] = k.to_s
          j += 1
        end
        
        if @input_string[i] != "," and @input_string[i] != nil
          raise "Input is missing a comma"
        end
        i += 1
        
        parsed_string = String.new
        parsed_number = String.new
        
      elsif @input_string[i] == " "
        if @input_string[i-1] != ","
          parsed_string << @input_string[i]
        end
        
      else
        raise "Input contains unfamilar characters"
      end
      
      i += 1
    end

  end
  
  def rounds
    @rounds_array
  end
  
end