class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if login(params[:email], params[:password], params[:remember_me])
      logger.debug("test: #{@current_user.class}")
      if @current_user.admin == 1
        flash[:success] = 'Welcome! Admin'
        redirect_to admin_path
      else
        flash[:success] = 'Welcome a Judge'
        redirect_to judge_path
      end
    else
      flash.now[:warning] = 'E-mail and/or password is incorrect.'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'See you!'
    redirect_to log_in_path
  end
end