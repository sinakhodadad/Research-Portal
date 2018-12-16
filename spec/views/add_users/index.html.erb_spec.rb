require 'rails_helper'

RSpec.describe "add_users/index", type: :view do
  before(:each) do
    assign(:add_users, [
      AddUser.create!(
        :email => "Email",
        :name => "Name",
        :family => "Family",
        :role => "Role"
      ),
      AddUser.create!(
        :email => "Email",
        :name => "Name",
        :family => "Family",
        :role => "Role"
      )
    ])
  end

  it "renders a list of add_users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Family".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
