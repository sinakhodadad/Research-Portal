require 'rails_helper'

RSpec.describe Sponsor, type: :model do

	@sponsor= Sponsor.new({:name => 'University of Tehran'})

    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name).case_insensitive}

    it{ should have_many(:projects)}

end
