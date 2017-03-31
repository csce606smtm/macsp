require 'spec_helper.rb'

describe ResetPasswordsController, :type => :controller do
    before :each do
        @fakeUser = double("User")
    end
    
    it "#creates" do 
        post :create
        expect(response).to redirect_to(log_in_path)
    end
    
    it "#edits" do #Failing, See below
        get :edit
        expect(response).to redirect_to(log_in_path)
    end
    
    it "#updates" do #Failing, It isn't finding the update route for some reason. However it seems to be listed in /config/routes.rb
        put :update
        expect(response).to redirect_to(log_in_path)
    end
end