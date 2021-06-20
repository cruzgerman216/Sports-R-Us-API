class MyValidator < ActiveModel::Validator
    def validate(record)
        if record.username
            unless record.username.chars.any? { |char| ('a'..'z').include? char.downcase }
                record.errors.add :username, "don't"
            end
        end
    end
  end

class User < ApplicationRecord
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, uniqueness:true 
    validates :username, presence: true, length: {minimum: 2, maximum: 15}, uniqueness:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
    validates_with MyValidator
end
