require 'rails_helper'

RSpec.describe "contents/edit", type: :view do
  before(:each) do
    @content = assign(:content, Content.create!(
      :userid => 1,
      :post => "MyText"
    ))
  end

  it "renders the edit content form" do
    render

    assert_select "form[action=?][method=?]", content_path(@content), "post" do

      assert_select "input#content_userid[name=?]", "content[userid]"

      assert_select "textarea#content_post[name=?]", "content[post]"
    end
  end
end
