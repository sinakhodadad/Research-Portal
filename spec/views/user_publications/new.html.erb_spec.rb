require 'rails_helper'

RSpec.describe "user_publications/new", type: :view do
  before(:each) do
    assign(:user_publication, UserPublication.new(
      :user_id => 1,
      :publication_id => 1
    ))
  end

  it "renders new user_publication form" do
    render

    assert_select "form[action=?][method=?]", user_publications_path, "post" do

      assert_select "input#user_publication_user_id[name=?]", "user_publication[user_id]"

      assert_select "input#user_publication_publication_id[name=?]", "user_publication[publication_id]"
    end
  end
end
