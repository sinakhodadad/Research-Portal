require 'rails_helper'

RSpec.describe News, type: :model do

	before do 
		@news = News.new({:title => 'Service 101: Thousands of Bruins volunteer across Los Angeles
		', :body => 'The sleeping giant that is Volunteer Day began rousing before dawn; by 8 a.m. a slow-moving human “river” formed by thousands of students, all garbed in Volunteer Day T-shirts, flowed down from the Hill’s residence halls into Drake Stadium and out onto Charles Young Drive where buses were loading to take off.
		Amid upbeat greetings of “Happy Volunteer Day!” from residence hall staff, the new students from near and far — from distant places like Hawaii, Dubai and Cleveland, Ohio — found themselves ready to explore L.A. the Bruin way: through community service.
		'})
	end


	it {should validate_presence_of(:title)}
  	it {should validate_presence_of(:body)}
end
