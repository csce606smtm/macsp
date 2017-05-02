class QsheetsController < ApplicationController
  before_action :set_qsheet, only: [:show, :edit, :update, :destroy]

  # GET /qsheets
  # GET /qsheets.json
  def index
    if current_user.user_type == 'Admin'
      @qsheets = Qsheet.all
      @contests = Contest.all
      @divisions = Division.all
    else 
      @@contest_id = Contest.find(Judge.find(current_user.id)).id
      _allDivisions = Division.find_by_contest_id(contest_id)
      _allDivisions.each do |currDiv|
        @qsheets = Qsheet.find_by_division_id(currDiv.id)
      end 
    end 
      
    
    # @currIndex = 0
  end

  # GET /qsheets/1
  # GET /qsheets/1.json
  def show
    @qsheet = Qsheet.find(params[:id]) # retrieve question ID from URI route
    # puts "About to use tsheet"
    # @tSheet = "Hello again"
    
  end

  # GET /qsheets/new
  def new
    @contest = Contest.find(params[:id])
    @qsheet = Qsheet.new
    2.times { @qsheet.questions.build }
  end

  # GET /qsheets/1/edit
  def edit
    @qsheet = Qsheet.find_by(:id => params[:id])
    @division = Division.find_by(:id => @qsheet.division_id)
    @contest = Contest.find_by(:id => @division.contest_id)
  end

  # POST /qsheets
  # POST /qsheets.json
  def create
    @qsheet = Qsheet.new(qsheet_params)
    #@contests = Contest.find(1)
    respond_to do |format|
      if @qsheet.save
        format.html { redirect_to @qsheet, notice: 'Qsheet was successfully created.' }
        format.json { render :show, id: @qsheet.id, status: :created, location: @qsheet }
      else
        format.html { render :new }
        format.json { render json: @qsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qsheets/1
  # PATCH/PUT /qsheets/1.json
  def update
    @qsheet = Qsheet.find_by(:division_id => params[:id])
    respond_to do |format|
      if params[:qsheet] != nil
        save_questions(params[:qsheet][:questions_attributes], @qsheet.division_id)
      end
      
      format.html { redirect_to @qsheet, notice: 'Qsheet was successfully updated.' }
      format.json { render :show, status: :ok, location: @qsheet }
    end
  end

  # DELETE /qsheets/1
  # DELETE /qsheets/1.json
  def destroy
    @question = Question.find(params[:id])
    @scores = Scoresheet.where(:question_id => @question.id)
    @scores.each do |s|
      s.destroy
    end
    @question.destroy 
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Qsheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qsheet
      # @qsheet = Qsheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qsheet_params
      params.require(:qsheet).permit(:contest, :questions_attributes => [:id, :content, :dataType])
    end

    def save_questions(qs, division_id)
      if qs == nil
        return false
      end
      qs.each do |q|
        question = Question.new
        question.dataType = q[1][:dataType]
        question.content = q[1][:content]
        question.qsheet_id= Qsheet.find_by(:division_id => division_id).id
        if !question.save()
          return false
        end

        Auctioneer.where(:division_id => division_id).each do |auc|
          score = Scoresheet.new
          score.auctioneer_id = auc.id
          score.question_id = question.id
          score.score = "empty"
          if !score.save()
            return false
          end
        end
      end
      return true
    end
end
