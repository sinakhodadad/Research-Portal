require 'rails_helper'

RSpec.describe "publications/index", type: :view do
    before(:each) do
        assign(:publications, [
            Fabricate(:publication),
            Fabricate(:publication)
        ])
    end

    it "renders a list of publications" do
        render
        assert_select "tr", :count => 3
    end
end
