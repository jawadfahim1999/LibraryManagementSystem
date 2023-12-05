class Book < ApplicationRecord
    has_many :checkouts
    def self.search(query)
        where('title LIKE ? OR author LIKE ? OR isbn LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")
    end
end
  