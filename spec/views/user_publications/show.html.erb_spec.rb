require 'rails_helper'

RSpec.describe "user_publications/show", type: :view do
  before(:each) do
    @user_publication = assign(:user_publication, UserPublication.create!(
      :user_id => 1,
      :publication_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
