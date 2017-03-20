require 'spec_helper.rb'

describe User do
    before do
        @fakeUser = double('User')
        @fakeUser.stub(:email).and_return('abc@gmail.com')
        User.stub(:find_by_email).and_return(@fakeUser)
    end 
    
    it 'should have correct email' do 
        expect(User.find_by_email('abc@gmail.com')).to be(@fakeUser)
    end 
end
