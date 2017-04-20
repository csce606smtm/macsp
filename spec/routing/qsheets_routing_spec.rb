require "rails_helper"

RSpec.describe QsheetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/qsheets").to route_to("qsheets#index")
    end

    it "routes to #new" do
      expect(:get => "/qsheets/new").to route_to("qsheets#new")
    end

    it "routes to #show" do
      expect(:get => "/qsheets/1").to route_to("qsheets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/qsheets/1/edit").to route_to("qsheets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/qsheets").to route_to("qsheets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/qsheets/1").to route_to("qsheets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/qsheets/1").to route_to("qsheets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/qsheets/1").to route_to("qsheets#destroy", :id => "1")
    end

  end
end
