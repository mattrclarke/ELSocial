require 'rails_helper'

RSpec.describe "leases/edit", type: :view do
  before(:each) do
    @lease = assign(:lease, Lease.create!(
      :location => "MyString",
      :coordinates => "MyString"
    ))
  end

  it "renders the edit lease form" do
    render

    assert_select "form[action=?][method=?]", lease_path(@lease), "post" do

      assert_select "input[name=?]", "lease[location]"

      assert_select "input[name=?]", "lease[coordinates]"
    end
  end
end
