require 'rails_helper'

RSpec.describe "sponsors/new", type: :view do
  before(:each) do
    assign(:sponsor, Sponsor.new(
      :name => "MyString"
    ))
  end

  it "renders new sponsor form" do
    render

    assert_select "form[action=?][method=?]", sponsors_path, "post" do

      assert_select "input#sponsor_name[name=?]", "sponsor[name]"
    end
  end
end
