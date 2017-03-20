class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = @isAdmin #for testing
      if params[:user][:admin] == "1"
        login(params[:user][:email], params[:user][:password])
        flash[:success] = 'Welcome! Admin'
      else
        flash[:success] = 'Successfully created a Judge'
      end
      redirect_to root_path 
    else
      render 'new'
    end
  end

  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      flash[:success] = 'User was successfully activated.'
      redirect_to log_in_path
    else
      flash[:warning] = 'Cannot activate this user.'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :admin)
  end
end