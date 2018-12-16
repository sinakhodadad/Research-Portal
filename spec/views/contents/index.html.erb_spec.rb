require 'rails_helper'

RSpec.describe "contents/index", type: :view do
  before(:each) do
    assign(:contents, [
      Content.create!(
        :userid => 1,
        :post => "MyText"
      ),
      Content.create!(
        :userid => 1,
        :post => "MyText"
      )
    ])
  end

  it "renders a list of contents" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
