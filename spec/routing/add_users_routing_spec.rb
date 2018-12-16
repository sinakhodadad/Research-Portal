require "rails_helper"

RSpec.describe AddUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/add_users").to route_to("add_users#index")
    end

    it "routes to #new" do
      expect(:get => "/add_users/new").to route_to("add_users#new")
    end

    it "routes to #show" do
      expect(:get => "/add_users/1").to route_to("add_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/add_users/1/edit").to route_to("add_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/add_users").to route_to("add_users#create")
    end

    it "routes to #update" do
      expect(:put => "/add_users/1").to route_to("add_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/add_users/1").to route_to("add_users#destroy", :id => "1")
    end

  end
end
