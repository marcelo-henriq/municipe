class Address < ApplicationRecord

  validates :zipcode, :ibge_code, :address, :neighborhood, :complement, :city, :state, presence: true
end
