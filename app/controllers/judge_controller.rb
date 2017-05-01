class JudgeController < ApplicationController
    skip_before_action :require_login
    def to_s
        attributes.each_with_object("") do |attribute, result|
            result << "#{attribute[1].to_s} "
        end
    end
    def index
        #hi - aaron
        
        @currJudge = Judge.find_by(user_id: current_user.id)
        #flash[:notice] = @current_user.id
        @testJudge = Judge.find_by(user_id: current_user.id)
        @corrContest = Contest.find_by(id: @currJudge.contest_id)
        #flash[:notice] = @corrContest.contest_name
        @divList = Division.where( contest_id: @corrContest.id )
        #for each division in divList
            #auclist.push( Auctioneer.where(division_id : div.id)
        
        #@outTest_str = NULL
        @aucList = []
        @divList.each do |div|
            currAuc = Auctioneer.where(division_id: div.id)
            @aucList += currAuc
            #outTest_str
        end 
        
        @aucUserList = []
        @aucList.each do |auc|
            @aucUserList.push(User.find(auc.user_id))
        end 
        
        #for each division, get auctioneers and push to array
        #multiple auctioneers for each division
        
    end
    
    def score
        @scoringAuc = Auctioneer.find(params[:auc]) #the auc that judge is scoring
        @currJudge = Judge.find_by(user_id: current_user.id) #curr judge that is scoring
        @corrContest = Contest.find_by(id: @currJudge.contest_id) #judge's contest
        
        @corrQSheet = Qsheet.find_by(division_id: @scoringAuc.division_id)
        flash[:notice] = "QSheet: " + @corrQSheet
        @questions = Question.where(qsheet_id: 1)
    end 
end