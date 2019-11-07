require 'rails_helper'

RSpec.describe "leases/new", type: :view do
  before(:each) do
    assign(:lease, Lease.new(
      :location => "MyString",
      :coordinates => "MyString"
    ))
  end

  it "renders new lease form" do
    render

    assert_select "form[action=?][method=?]", leases_path, "post" do

      assert_select "input[name=?]", "lease[location]"

      assert_select "input[name=?]", "lease[coordinates]"
    end
  end
end
