require 'rails_helper'

RSpec.describe "news/edit", type: :view do
  before(:each) do
    @news = assign(:news, News.create!(
      :body => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit news form" do
    render

    assert_select "form[action=?][method=?]", news_path(@news), "post" do

      assert_select "input#news_body[name=?]", "news[body]"

      assert_select "input#news_title[name=?]", "news[title]"
    end
  end
end
