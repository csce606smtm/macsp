require 'spec_helper.rb'

describe SessionsController, :type => :controller do
    it "creates users" do
      fakeUser = User.create
      post :destroy
      expect(response).to redirect_to(log_in_path)
      #expect(response).to redirect_to('/root_path')
    end
end