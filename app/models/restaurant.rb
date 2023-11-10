class Restaurant < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :description, presence: true, length: {minimum: 10}
end
