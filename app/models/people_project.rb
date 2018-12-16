class PeopleProject < ActiveRecord::Base

    validates :user_id ,presence: true
    validates :project_id ,presence: true
    validates_uniqueness_of :user_id , scope: :project_id


    belongs_to :user
    belongs_to :project
end
