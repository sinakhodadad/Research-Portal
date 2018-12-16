require 'rails_helper'

RSpec.describe "journals/new", type: :view do
    before(:each) do
        assign(:journal, Journal.new(
            :name => "MyString"
        ))
    end

    it "renders new journal form" do
        render

        assert_select "form[action=?][method=?]", journals_path, "post" do

            assert_select "input#journal_name[name=?]", "journal[name]"
        end
    end
end
