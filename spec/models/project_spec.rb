require 'rails_helper'

RSpec.describe Project, type: :model do

    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:sponsor_id)}
    it{should validate_presence_of(:goal)}
    it{should validate_presence_of(:end_time)}
    it{should validate_presence_of(:start_date)}

    it {should have_many(:users).through(:people_projects)}
    it {should belong_to(:sponsor)}
    it {should have_many(:people_projects)}


    it "end time be grater than start time" do
        project = Fabricate.build(:project , start_date: Date.today , end_time: 1.days.ago)
        expect(project).not_to be_valid
        expect(project.errors[:end_time].any?).to be_truthy
    end

end