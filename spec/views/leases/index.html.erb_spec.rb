require 'rails_helper'

RSpec.describe "leases/index", type: :view do
  before(:each) do
    assign(:leases, [
      Lease.create!(
        :name => "name",

      ),
      Lease.create!(
        :name => "name",

      )
    ])
  end

  it "renders a list of leases" do
    render
    assert_select "tr>td", :text => "name".to_s, :count => 2

  end
end
