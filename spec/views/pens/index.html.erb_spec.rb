require 'rails_helper'

RSpec.describe "pens/index", type: :view do
  before(:each) do
    assign(:pens, [
      Pen.create!(
        :name => "Name",
        :lease => nil
      ),
      Pen.create!(
        :name => "Name",
        :lease => nil
      )
    ])
  end

  it "renders a list of pens" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
