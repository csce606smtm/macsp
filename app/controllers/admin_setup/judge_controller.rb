class AdminSetup::JudgeController < ApplicationController
    skip_before_action :require_login

    def new
        @user = User.new
        @member=User.where(user_type: "Judge")
    end

    def index
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        @user.user_type = "Judge"
      
        if @user.save
            flash[:success] = 'Successfully created a Judge'
        else
            flash[:success] = 'Failed to created a Judge'
        end
            redirect_to new_admin_setup_judge_path
    end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end