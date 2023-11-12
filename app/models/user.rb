class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }
    validates :email, presence: true, uniqueness: true

    has_many :reviews

    def banned?
        banned
    end

    def self.search(search)
        if search
            self.where("lower(username) LIKE ?", "%#{search.downcase}%")
        else
            @users = User.all
        end
    end
end
