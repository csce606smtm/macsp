require 'rails_helper'

RSpec.describe "qsheets/new", type: :view do
  before(:each) do
    assign(:qsheet, Qsheet.new(
<<<<<<< HEAD
      :contest => "MyString"
=======
      :contest => "MyString",
      :division => "MyString"
>>>>>>> origin/test3
    ))
  end

  it "renders new qsheet form" do
    render

    assert_select "form[action=?][method=?]", qsheets_path, "post" do

      assert_select "input#qsheet_contest[name=?]", "qsheet[contest]"
<<<<<<< HEAD
=======

      assert_select "input#qsheet_division[name=?]", "qsheet[division]"
>>>>>>> origin/test3
    end
  end
end
