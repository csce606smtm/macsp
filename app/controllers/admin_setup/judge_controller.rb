class AdminSetup::JudgeController < ApplicationController
    skip_before_action :require_login

    def new
        @user = User.new
        @new_judge = Judge.new
        @member = User.where(user_type: "Judge")
    end

    def index
        @user = User.new
        @new_judge = Judge.new
    end
    
    def create
        @user = User.new(user_params)
        @new_judge = Judge.new
        
        @user.user_type = "Judge"
        @user.bare_password = @user.password
      
        if @user.save
            flash[:success] = 'Successfully created a Judge'
            @new_judge.user_id = @user.id
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

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :bare_password)
  end

end