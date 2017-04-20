require 'rails_helper'

RSpec.describe "qsheets/index", type: :view do
  before(:each) do
    assign(:qsheets, [
      Qsheet.create!(
<<<<<<< HEAD
        :contest => "Contest"
      ),
      Qsheet.create!(
        :contest => "Contest"
=======
        :contest => "Contest",
        :division => "Division"
      ),
      Qsheet.create!(
        :contest => "Contest",
        :division => "Division"
>>>>>>> origin/test3
      )
    ])
  end

  it "renders a list of qsheets" do
    render
    assert_select "tr>td", :text => "Contest".to_s, :count => 2
<<<<<<< HEAD
=======
    assert_select "tr>td", :text => "Division".to_s, :count => 2
>>>>>>> origin/test3
  end
end
