require 'rails_helper'

RSpec.describe "journals/show", type: :view do
  before(:each) do
    @journal = assign(:journal, Journal.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
