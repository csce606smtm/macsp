require 'rails_helper'

RSpec.describe "qsheets/edit", type: :view do
  before(:each) do
    @qsheet = assign(:qsheet, Qsheet.create!(
<<<<<<< HEAD
      :contest => "MyString"
=======
      :contest => "MyString",
      :division => "MyString"
>>>>>>> origin/test3
    ))
  end

  it "renders the edit qsheet form" do
    render

    assert_select "form[action=?][method=?]", qsheet_path(@qsheet), "post" do

      assert_select "input#qsheet_contest[name=?]", "qsheet[contest]"
<<<<<<< HEAD
=======

      assert_select "input#qsheet_division[name=?]", "qsheet[division]"
>>>>>>> origin/test3
    end
  end
end
