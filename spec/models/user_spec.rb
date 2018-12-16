require 'rails_helper'

RSpec.describe User, type: :model do

	@user= User.new({:first_name => 'John', :last_name => 'Campell'})

	it {should validate_presence_of(:first_name)}
  	it {should validate_presence_of(:last_name)}
  	
  	it{ should have_many(:people_projects)}
  	it{ should have_many(:projects).through(:people_projects)}
  	it{ should have_many(:user_publications)}
  	it{ should have_many(:publications).through(:user_publications)}
  	it{ should have_many(:user_contexts)}
end