require 'rails_helper'

RSpec.describe "mortality_forms/new", type: :view do
  before(:each) do
    assign(:mortality_form, MortalityForm.new(
      :bird_strikes => 1,
      :seal_strikes => 1,
      :skinny => 1,
      :deformities => 1,
      :unknown => 1,
      :mort_comments => "MyText",
      :shallow_rot => 1,
      :deep_rot => 1,
      :missing_weights => 1,
      :skin_burn => "MyString",
      :fish_rub => 1,
      :probe_cleaned => 1,
      :observations => "MyText",
      :pen => nil,
      :lease => nil
    ))
  end

  it "renders new mortality_form form" do
    render

    assert_select "form[action=?][method=?]", mortality_forms_path, "post" do

      assert_select "input[name=?]", "mortality_form[bird_strikes]"

      assert_select "input[name=?]", "mortality_form[seal_strikes]"

      assert_select "input[name=?]", "mortality_form[skinny]"

      assert_select "input[name=?]", "mortality_form[deformities]"

      assert_select "input[name=?]", "mortality_form[unknown]"

      assert_select "textarea[name=?]", "mortality_form[mort_comments]"

      assert_select "input[name=?]", "mortality_form[shallow_rot]"

      assert_select "input[name=?]", "mortality_form[deep_rot]"

      assert_select "input[name=?]", "mortality_form[missing_weights]"

      assert_select "input[name=?]", "mortality_form[skin_burn]"

      assert_select "input[name=?]", "mortality_form[fish_rub]"

      assert_select "input[name=?]", "mortality_form[probe_cleaned]"

      assert_select "textarea[name=?]", "mortality_form[observations]"

      assert_select "input[name=?]", "mortality_form[pen_id]"

      assert_select "input[name=?]", "mortality_form[lease_id]"
    end
  end
end
