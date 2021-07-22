class Address < ApplicationRecord
  validates :zipcode, :address, :residencial_number, :neighborhood, :city, :state, presence: true
end
