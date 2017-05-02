class AdminController < ApplicationController
    skip_before_action :require_login

    def index
        @contests = Contest.all
        @currMax = 0;
        @divisionMaxs = {}
        @contests.each do |contest|
            Division.where(contest_id: contest.id).each do |div|
                if  @divisionMaxs.key?(div.division_name.to_s + contest.contest_name.to_s) && @divisionMaxs[div.division_name.to_s + contest.contest_name.to_s] < div.round 
                    @divisionMaxs[div.division_name.to_s + contest.contest_name.to_s] = div.round
                else
                    @divisionMaxs[div.division_name.to_s + contest.contest_name.to_s] = div.round
                end
            end
        end
        #So hannah. To find the max rounds of say the rookie lonestar: max round = @divisionMaxs[div.division_name.to_s + contest.contest_name.to_s]
        @aucData_scoresRAW = {}
        @aucAvgScore = {} #{id => avg}
        @SSS = Scoresheet.all
        
        @SSS.each do |ss|
            @ssScore = ss.score
                if @ssScore == 'empty'
                    @ssScore = 0
                end
            if @aucData_scoresRAW.key?(ss.auctioneer_id)
                currentN = @aucData_scoresRAW[ss.auctioneer_id][0]
                currentSum = @aucData_scoresRAW[ss.auctioneer_id][1]
                @aucData_scoresRAW[ss.auctioneer_id][0] = currentN + 1
                @aucData_scoresRAW[ss.auctioneer_id][1] = currentSum + @ssScore
            else
                @aucAvgScore[ss.auctioneer_id] = 0
                @aucData_scoresRAW[ss.auctioneer_id] = [1,@ssScore]
            end
        end     
        @aucData_scoresRAW.each do |key, value|
            if value[0] != 0
                @aucAvgScore[key] = value[1]/value[0]
            end
        end
        #So hannah. To find the average score of an auctioneer: avgScore = @aucAvgScore[auctioneer_id]
        
        
    end
    
    def contest
    end 
    
    def judge
    end
    
    def auctioneer
    end
    
    def scoreSummary
        @auctioneerId = params[:auc_id]
        @contestName = params[:contest_name]
        @auctioneerName = Auctioneer.find(@auctioneerId)
        @auc = Auctioneer.find_by(:id => @auctioneerId)
       
        @user = User.find_by(:id => @auc.user_id)
        @div = Division.find_by(:id => @auc.division_id)
        @contest = Contest.find_by(:id => @div.contest_id)
        
        @qsheet = Qsheet.find_by(:id => @div.id)
        @qs = Question.where(:qsheet_id => @qsheet.id)
        @judge = Judge.find_by(:user_id => current_user.id)
        
        #@scoresHash = {}
        #@qs.each do |q|
            #@scoresHash[q] = Scoresheet.where(:auctioneer_id => @auc.id, :question_id => q.id, :judge_id => @judge.id)
        #end
        
        
        
    end
    
end