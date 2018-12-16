require 'rails_helper'

RSpec.describe UserPublication, type: :model do
    it { should belong_to(:user) }
    it { should belong_to(:publication) }


    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:publication_id)}
end
