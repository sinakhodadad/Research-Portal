require 'rails_helper'

RSpec.describe AddUser, type: :model do

	before do
		@adduser = AddUser.new({:email => 'sinamd443@gmail.com', :name => 'sina', :family => 'Khodadad', :role => 'Student'})
	end

	it {should validate_presence_of(:email)}
	it {should validate_presence_of(:name)}
	it {should validate_presence_of(:family)}
	it {should validate_presence_of(:role)}
end
