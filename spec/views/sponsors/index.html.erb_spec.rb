require 'rails_helper'

RSpec.describe "sponsors/index", type: :view do
  before(:each) do
    assign(:sponsors, [
      Sponsor.create!(
        :name => "Name 1"
      ),
      Sponsor.create!(
        :name => "Name 2"
      )
    ])
  end

  it "renders a list of sponsors" do
    render
    assert_select "tr>td", :text => "Name 1".to_s, :count => 1
    assert_select "tr>td", :text => "Name 2".to_s, :count => 1
  end
end
