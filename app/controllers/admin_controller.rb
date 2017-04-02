class AdminController < ApplicationController
  def index
  end
  
  def setup
    logger.debug("enter new")
    @user = User.new
  end
  
  def judge
    @user = User.new
    @member=User.where(user_type: "Judge")
  end
  
  def auctioneer
    @user = User.new
    @member=User.where(user_type: "Auctioneer")
  end
  
end
