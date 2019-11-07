require 'rails_helper'

RSpec.describe "pens/edit", type: :view do
  before(:each) do
    @pen = assign(:pen, Pen.create!(
      :name => "MyString",
      :lease => nil
    ))
  end

  it "renders the edit pen form" do
    render

    assert_select "form[action=?][method=?]", pen_path(@pen), "post" do

      assert_select "input[name=?]", "pen[name]"

      assert_select "input[name=?]", "pen[lease_id]"
    end
  end
end
