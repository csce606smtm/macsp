class AdminSetup::AuctioneerController < ApplicationController
    skip_before_action :require_login

    def new
        @user = User.new
        @member = User.where(user_type: "Auctioneer")
        @division = Division.new
        @new_auctioneer = Auctioneer.new
        
        @user_all = User.all
        @contest_all = Contest.all
        @division_all = Division.all
        @auctioneer_all = Auctioneer.all
        
        @aList = []
        
        @auctioneer_all.each do |auctioneer|
            @division_all.each do |division|
                if auctioneer.division_id == division.id
                    @contest_all.each do |contest|
                        if division.contest_id == contest.id
                            mem = {}
                            mem[:id] = auctioneer.user_id
                            mem[:contest_id] = contest.id
                            mem[:contest_name] = contest.contest_name
                            mem[:division_name] = division.division_name
                            mem[:round] = division.round
                            
                            @user_all.each do |user|
                                if user.id == auctioneer.user_id
                                    mem[:email] = user.email
                                    mem[:name] = user.name
                                    
                                    break
                                end
                            end
                            
                            @aList << mem
                            
                            break
                        end
                    end
                    
                    break
                end
            end
        end
    end

    def index
        @user = User.new
        @new_auctioneer = Auctioneer.new
    end
    def create
        @user = User.new(user_params)
        @user.password = "auctioneer_default"
        @user.password_confirmation = "auctioneer_default"
        @user.bare_password = "auctioneer_default"
        @user.user_type = "Auctioneer"
        
        @new_auctioneer = Auctioneer.new
        
        if @user.save
            flash[:success] = 'Successfully created a Auctioneer'
            
            @new_auctioneer.user_id = @user.id
            @new_auctioneer.division_id = params[:division][:division_name]
            @new_auctioneer.save
        else
            flash[:success] = 'Failed to created a Auctioneer'
        end
            redirect_to new_admin_setup_auctioneer_path
    end

    def destroy
        @auctioneer = User.find params[:id]
        @new_auctioneer = Auctioneer.find_by(user_id: @auctioneer.id)
        
        @new_auctioneer.destroy
        @auctioneer.destroy
        flash[:notice] = "Auctioneer #{@auctioneer.name} deleted"
        redirect_to new_admin_setup_auctioneer_path
    end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :bare_password)
  end

end