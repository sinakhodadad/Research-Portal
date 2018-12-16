require 'rails_helper'

RSpec.describe "projects/index", type: :view do
    before(:each) do
        assign(:projects, [
            Fabricate(:project, goal: "Goal"),
            Fabricate(:project, goal: "Goal")
        ])
    end

    it "renders a list of projects" do
        render
        assert_select "tr>td", :text => "Goal".to_s, :count => 2
    end
end
