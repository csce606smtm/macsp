class AdminSetup::AuctioneerController < ApplicationController
    skip_before_action :require_login

    def new
        @user = User.new
        @member = User.where(user_type: "Auctioneer")
        
        @new_auctioneer = Auctioneer.new
    end

    def index
        @user = User.new
        @new_auctioneer = Auctioneer.new
    end
    def create
        @user = User.new(user_params)
        @user.user_type = "Auctioneer"
      
        @new_auctioneer = Auctioneer.new
        
        if @user.save
            flash[:success] = 'Successfully created a Auctioneer'
            
            @new_auctioneer.user_id = @user.id
            @new_auctioneer.save
        else
            flash[:success] = 'Failed to created a Auctioneer'
        end
            redirect_to new_admin_setup_auctioneer_path
    end

    def destroy
        @auctioneer = User.find params[:id]
        @new_auctioneer = Auctioneer.find_by(user_id: @auctioneer.id)
        
        @auctioneer.destroy
        @new_auctioneer.destroy
        flash[:notice] = "Auctioneer #{@auctioneer.name} deleted"
        redirect_to new_admin_setup_auctioneer_path
    end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :bare_password)
  end

end