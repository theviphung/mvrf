class Review < ApplicationRecord
    
    validates :rating, numericality: { only_integer: true }, presence: true
    validates :content, length: { maximum: 5000 }
    
    belongs_to :user
end