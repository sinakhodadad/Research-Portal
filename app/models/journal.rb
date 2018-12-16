class Journal < ActiveRecord::Base
    validates :name , presence: true
    validates :name , uniqueness: {case_sensitive: false}

    has_many :publications
end

