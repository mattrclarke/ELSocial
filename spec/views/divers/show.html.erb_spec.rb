require 'rails_helper'

RSpec.describe "divers/show", type: :view do
  before(:each) do
    @diver = assign(:diver, Diver.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :contact => "Contact",
      :address => "Address",
      :secondary_contact => "Secondary Contact"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Secondary Contact/)
  end
end
