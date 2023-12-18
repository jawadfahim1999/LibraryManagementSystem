class Book < ApplicationRecord
    has_many :checkouts
    scope :search, ->(query) 
    {
        where('title LIKE ? OR author LIKE ? OR isbn LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")
    }
end
  