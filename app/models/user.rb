class User < ApplicationRecord
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, uniqueness:true 
    validates :username, presence: true, length: {minimum: 2, maximum: 15}, uniqueness:true 

end
