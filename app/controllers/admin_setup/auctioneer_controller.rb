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
        @auctioneer_all = Auctioneer.select(:division_id, :user_id).uniq
        
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
        
        if @user.save
            flash[:success] = 'Successfully created a Auctioneer'
            
            puts "danguria div id #{params[:division][:division_name]}"
            div = Division.find_by(:id => params[:division][:division_name])
            Judge.where(:contest_id => div.contest_id).each do |judge|
                new_auc = Auctioneer.new
                new_auc.user_id = @user.id
                new_auc.division_id = div.id
                new_auc.judge_id = judge.id
                new_auc.done = "false"
                new_auc.save
            end
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