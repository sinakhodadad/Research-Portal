# require 'rails_helper'

# RSpec.describe "projects/new", type: :view do
#     let(:user) {Fabricate(:user)}
#     before(:each) do

#         sign_in :user , user
#         assign(:sponsors, [
#             Fabricate(:sponsor),
#             Fabricate(:sponsor)
#         ])
#         assign(:project, Fabricate.build(:project))
#     end

#     it "renders new project form" do
#         render

#         assert_select "form[action=?][method=?]", projects_path, "post" do

#             assert_select "input#project_title[name=?]", "project[title]"

#             assert_select "textarea#project_goal[name=?]", "project[goal]"

#             assert_select "select#project_sponsor_id[name=?]", "project[sponsor_id]"
#         end
#     end
# end
