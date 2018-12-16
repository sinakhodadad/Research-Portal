require 'rails_helper'

RSpec.describe "news/new", type: :view do
  before(:each) do
    assign(:news, News.new(
      :body => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new news form" do
    render

    assert_select "form[action=?][method=?]", news_index_path, "post" do

      assert_select "input#news_body[name=?]", "news[body]"

      assert_select "input#news_title[name=?]", "news[title]"
    end
  end
end
