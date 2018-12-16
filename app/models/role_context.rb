class RoleContext < ActiveRecord::Base
    belongs_to :role
    belongs_to :context
end