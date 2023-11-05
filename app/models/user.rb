class User < ApplicationRecord

    attr_accessor :username, :email

    # Validations to ensure data integrity and security
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    def self.save(username, password)
        user = User.new(username: username, password: password)
        user.save
        user
    end

end