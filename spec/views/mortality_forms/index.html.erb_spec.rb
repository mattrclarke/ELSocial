require 'rails_helper'

RSpec.describe "mortality_forms/index", type: :view do
  before(:each) do
    assign(:mortality_forms, [
      MortalityForm.create!(
        :bird_strikes => 2,
        :seal_strikes => 3,
        :skinny => 4,
        :deformities => 5,
        :unknown => 6,
        :mort_comments => "MyText",
        :shallow_rot => 7,
        :deep_rot => 8,
        :missing_weights => 9,
        :skin_burn => "Skin Burn",
        :fish_rub => 10,
        :probe_cleaned => 11,
        :observations => "MyText",
        :pen => nil,
        :lease => nil
      ),
      MortalityForm.create!(
        :bird_strikes => 2,
        :seal_strikes => 3,
        :skinny => 4,
        :deformities => 5,
        :unknown => 6,
        :mort_comments => "MyText",
        :shallow_rot => 7,
        :deep_rot => 8,
        :missing_weights => 9,
        :skin_burn => "Skin Burn",
        :fish_rub => 10,
        :probe_cleaned => 11,
        :observations => "MyText",
        :pen => nil,
        :lease => nil
      )
    ])
  end

  it "renders a list of mortality_forms" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => "Skin Burn".to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
