class AdminSetup::ContestController < ApplicationController
    skip_before_action :require_login

    def new
        @user = User.new
        @member=User.where(user_type: "Judge")
    end

    def index
       
    end
    def create
        
    end

    def destroy
        
    end

  private

  def user_params
    
  end

end