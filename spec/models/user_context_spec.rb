require 'rails_helper'

RSpec.describe UserContext, type: :model do

	it {should validate_presence_of(:value)}
  	it {should validate_presence_of(:user_id)}
  	it {should validate_presence_of(:context_id)}
  	
  	it { should belong_to(:user) }
    it { should belong_to(:context) }
   
end
