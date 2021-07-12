class Address < ApplicationRecord
  belongs_to :citizen

  validates :zipcode, :ibge_code, :address, :neighborhood, :complement, :city, :state, presence: true
end
