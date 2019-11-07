require 'rails_helper'

RSpec.describe "mortality_forms/show", type: :view do
  before(:each) do
    @mortality_form = assign(:mortality_form, MortalityForm.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/Skin Burn/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
