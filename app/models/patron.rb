class Patron < ApplicationRecord
    has_many :checkouts
end
  