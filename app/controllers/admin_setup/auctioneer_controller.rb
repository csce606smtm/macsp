class AdminSetup::AuctioneerController < ApplicationController
    skip_before_action :require_login

    def new
        @user = User.new
        @member=User.where(user_type: "Auctioneer")
    end

    def index
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        @user.user_type = "Auctioneer"
      
        if @user.save
            flash[:success] = 'Successfully created a Auctioneer'
        else
            flash[:success] = 'Failed to created a Auctioneer'
        end
            redirect_to new_admin_setup_auctioneer_path
    end

    def destroy
        @auctioneer= User.find params[:id]
        @auctioneer.destroy
        flash[:notice] = "Auctioneer #{@auctioneer.name} deleted"
        redirect_to new_admin_setup_auctioneer_path
    end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end