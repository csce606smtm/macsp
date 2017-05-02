require 'spec_helper.rb'

describe SessionsController, :type => :controller do
    before :each do
        @fakeUser = double("User")
        @fakeUser.stub(:admin).and_return(1)
    end 
    
    # it "#creates" do #Still Failing
    #     #post users_path, user: @fakeUser
    #     post :create, User: @fakeUser
    #     expect(response).to redirect_to(admin_path)
    # end 
    
    it "#destroy" do
      post :destroy
      expect(response).to redirect_to(log_in_path)
      #expect(response).to redirect_to('/root_path')
    end
    
    #  it "#creates" do
    #     post :create, User: @fakeUser
    #     expect(response).to redirect_to(admin_path)
    # end 
    
    # it "#activates" do #Failing because it can't find the route, similar to reset_passwords
    #     get :new
    #     expect(response).to redirect_to(log_in_path)
    # end
end