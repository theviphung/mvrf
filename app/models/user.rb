class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }

    has many :reviews

end