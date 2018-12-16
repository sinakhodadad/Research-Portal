require 'rails_helper'

RSpec.describe "AddUsers", type: :request do
  describe "GET /add_users" do
    it "works! (now write some real specs)" do
      get add_users_path
      expect(response).to have_http_status(200)
    end
  end
end
