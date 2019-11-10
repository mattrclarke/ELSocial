require "rails_helper"

RSpec.describe DiversController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/divers").to route_to("divers#index")
    end

    it "routes to #new" do
      expect(:get => "/divers/new").to route_to("divers#new")
    end

    it "routes to #show" do
      expect(:get => "/divers/1").to route_to("divers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/divers/1/edit").to route_to("divers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/divers").to route_to("divers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/divers/1").to route_to("divers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/divers/1").to route_to("divers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/divers/1").to route_to("divers#destroy", :id => "1")
    end
  end
end
