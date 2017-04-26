class QsheetsController < ApplicationController
  before_action :set_qsheet, only: [:show, :edit, :update, :destroy]

  # GET /qsheets
  # GET /qsheets.json
  def index
    @rounds = getRound
    @currIndex = 0
  end

  # GET /qsheets/1
  # GET /qsheets/1.json
  def show
    id = params[:id] # retrieve question ID from URI route
    @tSheet = Qsheet.find(id).questions
    @incr = 0
    
  end

  # GET /qsheets/new
  def new
    @qsheet = Qsheet.new
    2.times { @qsheet.questions.build }
  end

  # GET /qsheets/1/edit
  def edit
    @question = Question.new
    @qsheet = Qsheet.new
    @curQSheet = {}
    getRound.each do |round|
      if round[:division_id].to_s == params[:id].to_s
        round[:questions] = getQuestions(params[:id])
        @curQSheet = round
      end
    end
    puts @curQSheet
  end

  # POST /qsheets
  # POST /qsheets.json
  def create
    @qsheet = Qsheet.new(qsheet_params)
    #@contests = Contest.find(1)
    respond_to do |format|
      if @qsheet.save
        format.html { redirect_to @qsheet, notice: 'Qsheet was successfully created.' }
        format.json { render :show, status: :created, location: @qsheet }
      else
        format.html { render :new }
        format.json { render json: @qsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qsheets/1
  # PATCH/PUT /qsheets/1.json
  def update
    respond_to do |format|
      if @qsheet.update(qsheet_params)
        format.html { redirect_to @qsheet, notice: 'Qsheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @qsheet }
      else
        format.html { render :edit }
        format.json { render json: @qsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qsheets/1
  # DELETE /qsheets/1.json
  def destroy
    @qsheet.destroy
    respond_to do |format|
      format.html { redirect_to qsheets_url, notice: 'Qsheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qsheet
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def qsheet_params
      params.require(:qsheet).permit(:contest, :questions_attributes => [:id, :content, :dataType])
    end
    
    def getRound
      rounds = []
      Division.all.select(:id).each do |div|
        Contest.joins(:divisions).where('divisions.id' => div.id).pluck_to_hash(:contest_id, :contest_name, :division_name, :round).each do |cfd|
          round = {}
          round[:contest_id] = cfd[:contest_id]
          round[:division_id] = div.id
          round[:round] = cfd[:round]
          round[:contest_name] = cfd[:contest_name]
          round[:division_name] = cfd[:division_name]
          rounds << round
        end
      end
      return rounds
    end
    
    def getQuestions(division_id)
      questions = []
      Qsheet.where(:division_id => division_id).each do |q|
        question = Question.find_by(:id => q.question_id)
        questions << {:qType => question.dataType, :qContent => question.content}
      end
      return questions
    end
   
end
