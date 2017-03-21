require 'spec_helper.rb'

describe SessionsController, :type => :controller do
    before :each do
        @fakeUser = double("User")
        @fakeUser.stub(:admin).and_return(1)
    end 
    
    # it "#creates" do 
    #     post users_path, user: @fakeUser
    #     expect(response).to redirect_to(admin_path)
    # end 
    
    it "#destroy" do
      post :destroy
      expect(response).to redirect_to(log_in_path)
      #expect(response).to redirect_to('/root_path')
           
      expect(response).to redirect_to(log_in_path)
      #expect(response).to redirect_to('/root_path')
    end
end