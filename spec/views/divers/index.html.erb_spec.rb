require 'rails_helper'

RSpec.describe "divers/index", type: :view do
  before(:each) do
    assign(:divers, [
      Diver.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :contact => "Contact",
        :address => "Address",
        :secondary_contact => "Secondary Contact"
      ),
      Diver.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :contact => "Contact",
        :address => "Address",
        :secondary_contact => "Secondary Contact"
      )
    ])
  end

  it "renders a list of divers" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Secondary Contact".to_s, :count => 2
  end
end
