require 'spec_helper.rb'
 
describe UsersController, :type => :controller do   
    before :each do #This needs to be adjusted for creates
        @fakeUser = double("User")
        @fakeUser.stub(:admin).and_return(1)
    end 
    

end