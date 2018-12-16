require 'rails_helper'

RSpec.describe "add_users/show", type: :view do
  before(:each) do
    @add_user = assign(:add_user, AddUser.create!(
      :email => "Email",
      :name => "Name",
      :family => "Family",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Family/)
    expect(rendered).to match(/Role/)
  end
end
