class Role < ActiveRecord::Base
    has_and_belongs_to_many :users, :join_table => :users_roles

    belongs_to :resource,
               :polymorphic => true
    has_many :role_contexts
    has_many :contexts , through: :role_contexts

    validates :resource_type,
              :inclusion => {:in => Rolify.resource_types},
              :allow_nil => true

    scopify
end
