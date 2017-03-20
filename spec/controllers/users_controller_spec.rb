require 'spec_helper.rb'

# describe UsersController do
#     describe 'add user' do
#         before :each do
#             @fakeUser=double(User, :email => "hello@gmail.com")
#             User.stub(:find_by_email).with('hello@gmail.com').and_return(@fakeUser)
#         end 
        
#         it 'should call create' do
#             expect(User.create).to eq(true)
#             #@fakeUser.stub!(:create).and_return(true)
#             #response.should redirect_to(final_path(@fakeUser))
#         end 
#     end 
# end