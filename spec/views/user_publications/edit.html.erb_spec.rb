require 'rails_helper'

RSpec.describe "user_publications/edit", type: :view do
  before(:each) do
    @user_publication = assign(:user_publication, UserPublication.create!(
      :user_id => 1,
      :publication_id => 1
    ))
  end

  it "renders the edit user_publication form" do
    render

    assert_select "form[action=?][method=?]", user_publication_path(@user_publication), "post" do

      assert_select "input#user_publication_user_id[name=?]", "user_publication[user_id]"

      assert_select "input#user_publication_publication_id[name=?]", "user_publication[publication_id]"
    end
  end
end
