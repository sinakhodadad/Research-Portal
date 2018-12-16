require 'rails_helper'
include Devise::TestHelpers

RSpec.describe "projects/edit", type: :view do
    let(:user) {Fabricate(:user)}
    before(:each) do

        assign(:users , [Fabricate(:user)])
        sign_in :user , user

        assign(:sponsors , [
            Fabricate(:sponsor) ,
            Fabricate(:sponsor)
        ])
        @project = assign(:project, Fabricate(:project))
    end

    it "renders the edit project form" do
        render

        # assert_select "form[action=?][method=?]", project_path(@project), "post" do
        #
        #     assert_select "input#project_title[name=?]", "project[title]"
        #
        #     assert_select "input#project_goal[name=?]", "project[goal]"
        #
        #     assert_select "input#project_sponsor_id[name=?]", "project[sponsor_id]"
        # end
    end
end
