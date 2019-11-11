require 'rails_helper'

RSpec.describe "leases/new", type: :view do
  before(:each) do
    assign(:lease, Lease.new(
      :name => "MyString",

    ))
  end

  it "renders new lease form" do
    render

    assert_select "form[action=?][method=?]", leases_path, "post" do

      assert_select "input[name=?]", "lease[name]"


    end
  end
end
