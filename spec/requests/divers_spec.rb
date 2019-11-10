require 'rails_helper'

RSpec.describe "Divers", type: :request do
  describe "GET /divers" do
    it "works! (now write some real specs)" do
      get divers_path
      expect(response).to have_http_status(200)
    end
  end
end
