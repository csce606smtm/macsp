class JudgeController < ApplicationController
    skip_before_action :require_login

    def index
        puts "hi user  #{current_user.id}"
        @judges = Judge.where(:user_id => current_user.id)
        @contests = []
        Contest.all.each do |c|
            @judges.each do |j|
                if c.id == j.contest_id
                    @contests << c
                end
            end
        end
        puts "contests: #{@contests}"
        @divisions = Division.all
    end

    def show
        @division = Division.find_by(:id => params[:id])
        @contest = Contest.find_by(:id => @division.contest_id)
        @auctioneers = Auctioneer.where(:division_id => params[:id]).uniq
        @users = []
        User.all.each do |user|
            @auctioneers.each do |auc|
                if user.id == auc.user_id
                    u = {}
                    u[:name] = user.name
                    u[:auc_id] = auc.id
                    u[:user_id] = user.id
                    @users << u
                end
            end
        end
    end

    def edit
       @auc = Auctioneer.find_by(:id => params[:id])
       @user = User.find_by(:id => @auc.user_id)
       @div = Division.find_by(:id => @auc.division_id)
       @contest = Contest.find_by(:id => @div.contest_id)

       @qsheet = Qsheet.find_by(:id => @div.id)
       @qs = Question.where(:qsheet_id => @qsheet.id)

       @scores = []
       @qs.each do |q|
        @scores << Scoresheet.where(:auctioneer_id => @auc.id, :question_id => q.id)
       end
    end

    def update
      params['output'].keys.each do |id|
        score = Scoresheet.find_by(:id => id.to_i)
        score.score = params['output'][id][:score]
        score.save()
      end

      redirect_to judge_index_path
    end
end