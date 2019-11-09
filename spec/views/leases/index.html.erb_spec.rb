require 'rails_helper'

RSpec.describe "leases/index", type: :view do
  before(:each) do
    assign(:leases, [
      Lease.create!(
        :location => "Location",

      ),
      Lease.create!(
        :location => "Location",

      )
    ])
  end

  it "renders a list of leases" do
    render
    assert_select "tr>td", :text => "Location".to_s, :count => 2

  end
end
