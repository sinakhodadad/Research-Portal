require 'rails_helper'

RSpec.describe "UserContexts", type: :request do
  describe "GET /user_contexts" do
    it "works! (now write some real specs)" do
      get user_contexts_path
      expect(response).to have_http_status(200)
    end
  end
end
