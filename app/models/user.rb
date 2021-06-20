class User < ApplicationRecord
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, uniqueness:true 
    validates :username, presence: true, length: {minimum: 2, maximum: 15}, uniqueness:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
    validate :username_needs_at_least_one_letter 

    def username_needs_at_least_one_letter 
        if username && username.count("a-zA-Z") == 0
            errors.add(:username, "at least one letter")
        end
    end
end
