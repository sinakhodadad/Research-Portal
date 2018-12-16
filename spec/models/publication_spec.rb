require 'rails_helper'

RSpec.describe Publication, type: :model do

    # @publication= Publication.new({
    # :title => 'Model Checking Mobile Ad Hoc Networks'
    # :year => '2016'
    # :volume => '85'
    # :page => '200'
    # :pageend => '226'
    # :journal_id => '1'
    # })


    it { should belong_to(:journal) }
    it { should have_many(:users) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:volume) }
    it { should validate_presence_of(:page) }
    it { should validate_presence_of(:pageend) }
    it { should validate_presence_of(:journal_id) }

    it { should validate_numericality_of(:page).only_integer }
    it { should validate_numericality_of(:volume).only_integer }
    it { should validate_numericality_of(:year).only_integer }

    it "year should be smaller the now" do
        publication = Fabricate.build(:publication, year: Date.today.year.to_i + 1)

        expect(publication).not_to be_valid

        expect(publication.errors[:year].any?).to be_truthy
    end
end
