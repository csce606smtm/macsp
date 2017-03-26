class AdminController < ApplicationController
  def index
  end
  
  def setup
    logger.debug("enter new")
    @user = User.new
  end
  
  def judge
    @user = User.new
    @member=User.where(admin: "0")
  end
  
  def auctioneer
    @user = User.new
    @member=User.where(admin: "0")
  end
  
end
