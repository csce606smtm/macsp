class AdminController < ApplicationController
  def index
  end
  
  def setup
    logger.debug("enter new")
    @user = User.new
  end
end
