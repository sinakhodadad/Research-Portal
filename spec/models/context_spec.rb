require 'rails_helper'

RSpec.describe Context, type: :model do
	it {should have_many(:role_contexts)}
	it {should have_many(:roles).through(:role_contexts)}
    
end
