class Address < ApplicationRecord

  validates :zipcode, :ibge_code, :address, :residencial_number, :neighborhood, :complement, :city, :state, presence: true
end
