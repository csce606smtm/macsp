describe 'SessionsController', type: :controller do
#   context 'when password is invalid' do
#     it 'renders the page with error' do
#       user = create(:user)

#       post :create, session: { email: user.email, password: 'invalid' }

#       expect(response).to render_template(:new)
#       expect(flash[:notice]).to match('E-mail and/or password is incorrect.')
#     end
#   end
  
  it "should pass params to subject" do
    post :create, :user => {:email => "abc@gmail.com"}
    assigns[:user].email.should == "abc@gmail.com"
  end

#   context 'when password is valid' do
#     it 'sets the user in the session and redirects them to their dashboard' do
#       user = create(:user)

#       post :create, session: { email: user.email, password: user.password }

#       expect(response).to redirect_to '/dashboard'
#       expect(controller.current_user).to eq user
#     end
#   end
end