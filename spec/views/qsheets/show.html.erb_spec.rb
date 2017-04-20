require 'rails_helper'

RSpec.describe "qsheets/show", type: :view do
  before(:each) do
    @qsheet = assign(:qsheet, Qsheet.create!(
<<<<<<< HEAD
      :contest => "Contest"
=======
      :contest => "Contest",
      :division => "Division"
>>>>>>> origin/test3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contest/)
<<<<<<< HEAD
=======
    expect(rendered).to match(/Division/)
>>>>>>> origin/test3
  end
end
