class AdminSetup::JudgeController < ApplicationController
    skip_before_action :require_login

    def new
        @user = User.new
        @new_judge = Judge.new
        @member = User.where(user_type: "Judge")
        @contest = Contest.new
        @judges = User.joins(:judges).pluck_to_hash(:contest_id)
        #@judges.each do |judge| Contest.where(:id => judge[:contest_id]).contest_name end
        
        @jList  = []
        contest_name = []
        @judges.each do |judge|
            @c = Contest.find_by(:id => judge[:contest_id])
            
            if @c != nil
                contest_name << @c.contest_name
            else
                contest_name << "-"
            end
        end
        
        i = 0
        @member.each do |member|
            mem = {}
            mem[:id] = member[:id]
            mem[:name] = member[:name]
            mem[:email] = member[:email]
            mem[:bare_password] = member[:bare_password]
            mem[:contest_name] = contest_name[i]
            i = i + 1
            @jList << mem
        end
        
    end

    def index
        @user = User.new
        @new_judge = Judge.new
        @contest = Contest.new
    end

    def create
        @user = User.new(user_params)
        @new_judge = Judge.new
        @contest = Contest.new
        
        puts params
        
        @user.user_type = "Judge"
        @user.bare_password = @user.password
        
        if @user.save
            flash[:success] = 'Successfully created a Judge'
            @new_judge.user_id = @user.id
            @new_judge.contest_id = params[:contest][:contest_name]
            @new_judge.save
        else
            flash[:success] = 'Failed to created a Judge'
        end
        redirect_to new_admin_setup_judge_path
    end

    def destroy
        @judge = User.find params[:id]
        @new_judge = Judge.find_by(user_id: @judge.id)
        
        @judge.destroy
        @new_judge.destroy
        
        flash[:notice] = "Judge #{@judge.name} deleted"
        redirect_to new_admin_setup_judge_path
    end
    
    def show
        puts "print!!"
        puts params
        
        
        redirect_to new_admin_setup_judge_path
    end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :bare_password)
  end

end