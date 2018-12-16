class UserPublication < ActiveRecord::Base
  validates :user_id , presence: true
  validates :publication_id , presence: true
  validates_uniqueness_of :user_id , scope: :publication_id

  belongs_to :publication
  belongs_to :user
end
