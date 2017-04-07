class AdminController < ApplicationController
    skip_before_action :require_login

    def index
    end
    
    def contest
    end 
    
    def judge
    end
    
    def auctioneer
    end
end