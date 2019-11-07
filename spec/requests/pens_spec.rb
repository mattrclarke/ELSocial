require 'rails_helper'

RSpec.describe "Pens", type: :request do
  describe "GET /pens" do
    it "works! (now write some real specs)" do
      get pens_path
      expect(response).to have_http_status(200)
    end
  end
end
