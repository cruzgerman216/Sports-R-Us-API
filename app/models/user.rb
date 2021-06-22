class User < ApplicationRecord
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, uniqueness:true 
    validates :username, presence: true, length: {minimum: 2, maximum: 15}, uniqueness:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
    validate :username_needs_at_least_one_letter 
    validates :first_name, :last_name, presence: true, length: {minimum: 1, maximum: 30}, format: { with: /\A[a-zA-Z]+\Z/ }
    validates :password, presence: true, length: {minimum: 5, maximum: 30}
    validate :bad_password
    
    def username_needs_at_least_one_letter 
        if username && username.count("a-zA-Z") == 0
            errors.add(:username, "at least one letter")
        end
    end

    def bad_password
        if password 
            if password.count("a-z") == 0
                errors.add(:password, "at least one lowercase letter")
            elsif password.count("A-Z") == 0
                errors.add(:password, "at least one upper case letter")
            elsif password.count("0-9") == 0
                errors.add(:password, "at least one number")
            elsif password.count("!@#$%\\^&*()_\\-+=") == 0
                errors.add(:password, "at least one symbol")
            end
        end
    end
    
end
