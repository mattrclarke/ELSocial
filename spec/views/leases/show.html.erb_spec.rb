require 'rails_helper'

RSpec.describe "leases/show", type: :view do
  before(:each) do
    @lease = assign(:lease, Lease.create!(
      :name => "name",

    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)

  end
end
