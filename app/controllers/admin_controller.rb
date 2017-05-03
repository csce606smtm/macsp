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
            @currQuestion = Question.find_by(:id => ss.question_id)
                if @currQuestion.dataType == 'S' || ss.score == 'empty'
                    @ssScore = 0
                else 
                    @ssScore = @ssScore.to_f
                    @ssScore =  (@ssScore*10).round / 10.0
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
        end
                
            
           
        #So hannah. To find the average score of an auctioneer: avgScore = @aucAvgScore[auctioneer_id]
        
        @aucList = User.where(user_type: "Auctioneer") #where auctioneers arent repeated
        
        
        
    end
    
    def scoreSummary
        @dataRow = 0
        @scoresheetN = 0
        @auctioneerId = params[:auc_id]
        @averageScore = params[:avgScore]
        @auc = Auctioneer.find_by(:id => @auctioneerId)
       
        @user = User.find_by(:id => @auc.user_id)
        @div = Division.find_by(:id => @auc.division_id)
        @contest = Contest.find_by(:id => @div.contest_id)
        
        @scoreSheets = Scoresheet.where(:auctioneer_id => @auc.id)
        @judgeHash = {}
        
        @contestName = params[:contest_name]
        @aucUser = User.find(@auc.user_id)
        @aucName = @aucUser.name
        @divName = @div.division_name
        @divRound = @div.round
        
        @scoreSheets.each do |scoreSheet|
            @currQuestion = Question.find_by(:id => scoreSheet.question_id)
            @currJudge = Judge.find(scoreSheet.judge_id)
            @currJudgeUser = User.find_by(:id => @currJudge.user_id)
            @judgeName = @currJudgeUser.name
            @updateTime =  @currQuestion.updated_at.to_formatted_s(:short)
                if @judgeHash.key?(scoreSheet.judge_id)
                    @judgeHash[scoreSheet.judge_id].push([@currQuestion.content,scoreSheet.score, @judgeName,@updateTime])
                else
                    @judgeHash[scoreSheet.judge_id] = [ [@currQuestion.content, scoreSheet.score, @judgeName,@updateTime] ]
                end
        end
        
        
        
    end
    

    
end