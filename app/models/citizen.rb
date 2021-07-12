class Citizen < ApplicationRecord
  has_one :address

  accepts_nested_attributes_for :address, allow_destroy: true

  #validates_presence_of Citizen.attribute_names
  validates :name, :cpf, :cns, :photo, :phonenumber, :status, presence: true
  validates :cpf, length: { is: 11 }
  validates :phonenumber, length: { is: 13 }
  #validates :birth_date, inclusion: { in: ->(g){ (50.year.ago..10.year.ago) } }
end
