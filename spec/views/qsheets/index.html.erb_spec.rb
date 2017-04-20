require 'rails_helper'

RSpec.describe "qsheets/index", type: :view do
  before(:each) do
    assign(:qsheets, [
      Qsheet.create!(
        :contest => "Contest",
        :division => "Division"
      ),
      Qsheet.create!(
        :contest => "Contest",
        :division => "Division"
      )
    ])
  end

  it "renders a list of qsheets" do
    render
    assert_select "tr>td", :text => "Contest".to_s, :count => 2
    assert_select "tr>td", :text => "Division".to_s, :count => 2
  end
end
