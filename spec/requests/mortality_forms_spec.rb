require 'rails_helper'

RSpec.describe "MortalityForms", type: :request do
  describe "GET /mortality_forms" do
    it "works! (now write some real specs)" do
      get mortality_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
