# Aaron created this April 7 when trying to build results page.... NEEDS FIXES
class Admin::ResultController < ApplicationController
    respond_to :js, :json, :html
    skip_before_action :require_login

    def new

    end

    def index
        flash[:success] = 'Successfully'
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

    def destroy
        @judge= User.find params[:id]
        @judge.destroy
        flash[:notice] = "Judge #{@judge.name} deleted"
        redirect_to new_admin_setup_judge_path
    end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
  
  def some_bs
      flash[:success] = 'Successfully'
  end

end