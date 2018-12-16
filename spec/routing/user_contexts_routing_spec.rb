require "rails_helper"

RSpec.describe UserContextsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_contexts").to route_to("user_contexts#index")
    end

    it "routes to #new" do
      expect(:get => "/user_contexts/new").to route_to("user_contexts#new")
    end

    it "routes to #show" do
      expect(:get => "/user_contexts/1").to route_to("user_contexts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_contexts/1/edit").to route_to("user_contexts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_contexts").to route_to("user_contexts#create")
    end

    it "routes to #update" do
      expect(:put => "/user_contexts/1").to route_to("user_contexts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_contexts/1").to route_to("user_contexts#destroy", :id => "1")
    end

  end
end
