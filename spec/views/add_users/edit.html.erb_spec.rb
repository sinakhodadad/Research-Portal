require 'rails_helper'

RSpec.describe "add_users/edit", type: :view do
  before(:each) do
    @add_user = assign(:add_user, AddUser.create!(
      :email => "MyString",
      :name => "MyString",
      :family => "MyString",
      :role => "MyString"
    ))
  end

  it "renders the edit add_user form" do
    render

    assert_select "form[action=?][method=?]", add_user_path(@add_user), "post" do

      assert_select "input#add_user_email[name=?]", "add_user[email]"

      assert_select "input#add_user_name[name=?]", "add_user[name]"

      assert_select "input#add_user_family[name=?]", "add_user[family]"

      assert_select "input#add_user_role[name=?]", "add_user[role]"
    end
  end
end
