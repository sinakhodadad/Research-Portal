require 'rails_helper'

RSpec.describe "publications/edit", type: :view do
    before(:each) do
        assign(:journals, [Fabricate(:journal)])
        assign(:users , [Fabricate(:user)])
        @publication = assign(:publication, Fabricate(:publication))
    end

    it "renders the edit publication form" do
        render

        assert_select "form[action=?][method=?]", publication_path(@publication), "post" do

            assert_select "input#publication_title[name=?]", "publication[title]"

            assert_select "input#publication_year[name=?]", "publication[year]"

            assert_select "input#publication_page[name=?]", "publication[page]"

            assert_select "input#publication_volume[name=?]", "publication[volume]"

            assert_select "select#publication_journal_id[name=?]", "publication[journal_id]"
        end
    end
end
