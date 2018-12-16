require 'rails_helper'

RSpec.describe PeopleProject, type: :model do
    it {should belong_to(:user)}
    it {should belong_to(:project)}
end
