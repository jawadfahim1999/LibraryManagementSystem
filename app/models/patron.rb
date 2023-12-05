class Patron < ApplicationRecord
    has_many :checkouts
    attr_accessor :email
end
  