class Citizen < ApplicationRecord
  mount_uploader :photo, CitizenPhotoUploader
  has_one :address

  accepts_nested_attributes_for :address, allow_destroy: true

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

end
