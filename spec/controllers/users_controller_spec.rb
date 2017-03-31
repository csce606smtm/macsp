require 'spec_helper.rb'
 
describe UsersController, :type => :controller do   
    before :each do #This needs to be adjusted for creates
        @fakeUser = double("User")
        @fakeUser.stub(:admin).and_return(1)
    end 
    
    it "#creates" do
        post :create, User: @fakeUser
        expect(response).to redirect_to(admin_path)
    end 
    
    it "#activates" do #Failing because it can't find the route, similar to reset_passwords
        get :activate
        expect(response).to redirect_to(log_in_path)
    end
end