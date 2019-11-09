require 'rails_helper'

RSpec.describe "leases/edit", type: :view do
  before(:each) do
    @lease = assign(:lease, Lease.create!(
      :location => "MyString",

    ))
  end

  it "renders the edit lease form" do
    render

    assert_select "form[action=?][method=?]", lease_path(@lease), "post" do

      assert_select "input[name=?]", "lease[location]"


    end
  end
end
