# require 'spec_helper.rb'

# describe AdminSetup::ContestController, :type => :controller do
#     before :each do
#         @fakeParams = double("params")
#     end 
    
#     it "#creates" do #Happy
#         @fakeParams.stub(:contest_name).and_return("Fake Contest")
#         @fakeParams.stub(:division).and_return("Fake Contest")
#         @fakeParams.stub(:division_name).and_return("Fake DivA:3, FakeDivB:1, FakeDivC:5")
#         post :create#, {:contest_name => "Fake Contest", :division => "Fake Contest", :division_name => "Fake DivA:3, FakeDivB:1, FakeDivC:5"}
#         expect(response).to redirect_to(new_admin_setup_contest_path)
#     end
# end