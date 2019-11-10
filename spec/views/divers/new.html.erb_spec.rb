require 'rails_helper'

RSpec.describe "divers/new", type: :view do
  before(:each) do
    assign(:diver, Diver.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :contact => "MyString",
      :address => "MyString",
      :secondary_contact => "MyString"
    ))
  end

  it "renders new diver form" do
    render

    assert_select "form[action=?][method=?]", divers_path, "post" do

      assert_select "input[name=?]", "diver[first_name]"

      assert_select "input[name=?]", "diver[last_name]"

      assert_select "input[name=?]", "diver[email]"

      assert_select "input[name=?]", "diver[contact]"

      assert_select "input[name=?]", "diver[address]"

      assert_select "input[name=?]", "diver[secondary_contact]"
    end
  end
end
