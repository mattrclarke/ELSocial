require "rails_helper"

RSpec.describe MortalityFormsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/mortality_forms").to route_to("mortality_forms#index")
    end

    it "routes to #new" do
      expect(:get => "/mortality_forms/new").to route_to("mortality_forms#new")
    end

    it "routes to #show" do
      expect(:get => "/mortality_forms/1").to route_to("mortality_forms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mortality_forms/1/edit").to route_to("mortality_forms#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/mortality_forms").to route_to("mortality_forms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mortality_forms/1").to route_to("mortality_forms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mortality_forms/1").to route_to("mortality_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mortality_forms/1").to route_to("mortality_forms#destroy", :id => "1")
    end
  end
end
