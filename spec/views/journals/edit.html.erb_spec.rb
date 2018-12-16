require 'rails_helper'

RSpec.describe "journals/edit", type: :view do
  before(:each) do
    @journal = assign(:journal, Journal.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit journal form" do
    render

    assert_select "form[action=?][method=?]", journal_path(@journal), "post" do

      assert_select "input#journal_name[name=?]", "journal[name]"
    end
  end
end
