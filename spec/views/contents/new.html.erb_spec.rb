require 'rails_helper'

RSpec.describe "contents/new", type: :view do
  before(:each) do
    assign(:content, Content.new(
      :userid => 1,
      :post => "MyText"
    ))
  end

  it "renders new content form" do
    render

    assert_select "form[action=?][method=?]", contents_path, "post" do

      assert_select "input#content_userid[name=?]", "content[userid]"

      assert_select "textarea#content_post[name=?]", "content[post]"
    end
  end
end
