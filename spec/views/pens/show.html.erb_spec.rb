require 'rails_helper'

RSpec.describe "pens/show", type: :view do
  before(:each) do
    @pen = assign(:pen, Pen.create!(
      :name => "Name",
      :lease => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
