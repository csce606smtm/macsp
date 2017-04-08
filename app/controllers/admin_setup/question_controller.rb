class AdminSetup::QuestionController< ApplicationController
    skip_before_action :require_login

    def new
        
    end

    def index
       
    end
    def create
        @poll = Poll.new(poll_params)
        choices_param = params[:choices]
        @choices = []
        choices_param.each.with_index(1) do |choice, index|
          choice = Choice.create(:text => choice, :location => index)
          @choices.push(choice)
        end
        @poll.choices = @choices
        @poll.user = User.find(params[:user_id])
        respond_to do |format|
          if @poll.save
            format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
            format.json { render json: @poll }
          else
            format.html { render :new }
            format.json { render json: @poll.errors.full_messages, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        
    end

  private

  def user_params
    
  end

end