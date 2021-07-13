class Citizen < ApplicationRecord
  has_one :address

  accepts_nested_attributes_for :address, allow_destroy: true

  #validates_presence_of Citizen.attribute_names
  validates :name, :cpf, :cns, :photo, :birth_date, :phonenumber, :status, presence: true
  validates :cpf, length: { is: 11 }
  validates :phonenumber, length: { is: 13 }
  validates :birth_date, inclusion: { in: 30.year.ago..1.day.ago, message: 'date must be included in range' }
  #custom validates
  validate :valid_cpf

  def valid_cpf
    cpfs = Citizen.where.not(id: self.id).map{ |citizen|
      citizen.cpf
    }

    return if CPF.valid?(self.cpf) and !cpfs.include? self.cpf

    errors.add(:cpf, 'cpf must be valid')
  end

  def formatted_phone
    "+#{self.phonenumber[0..1]} (#{self.phonenumber[2..3]})#{self.phonenumber[4..8]}-#{self.phonenumber[9..12]}"
  end
end
