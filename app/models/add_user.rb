class AddUser < ActiveRecord::Base
	validates :email, presence: true
    validates :name, presence: true
    validates :family, presence: true
    validates :role, presence: true
    
end
