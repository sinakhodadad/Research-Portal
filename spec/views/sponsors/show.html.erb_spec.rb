require 'rails_helper'

RSpec.describe "sponsors/show", type: :view do
  before(:each) do
    @sponsor = assign(:sponsor, Sponsor.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
