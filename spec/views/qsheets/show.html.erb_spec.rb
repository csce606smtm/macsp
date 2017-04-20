require 'rails_helper'

RSpec.describe "qsheets/show", type: :view do
  before(:each) do
    @qsheet = assign(:qsheet, Qsheet.create!(
      :contest => "Contest"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contest/)
  end
end
