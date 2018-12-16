class UserContext < ActiveRecord::Base
    validates :value, presence: true
    validates :user_id, presence: true
    validates :context_id, presence: true

    belongs_to :user
    belongs_to :context
end
