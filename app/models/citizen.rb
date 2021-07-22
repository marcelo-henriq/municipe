class Citizen < ApplicationRecord
  mount_uploader :photo, CitizenPhotoUploader
  has_one :address

  accepts_nested_attributes_for :address, allow_destroy: true

  validates :name, :email, :cpf, :cns, :photo, :birth_date, :country_code, :phonenumber, :status, presence: true
  validates :cpf, length: { is: 11 }
  validates :cns, length: { is: 15 }
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :phonenumber, length: { is: 11 }
  validates :birth_date, inclusion: { in: 100.year.ago..1.day.ago, message: :out_of_range }
  #custom validates
  validates_format_of :name, with: /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/, message: :invalid
  validate :valid_cpf
  validate :valid_cns

  def valid_cpf
    cpfs = Citizen.where.not(id: self.id).map{ |citizen|
      citizen.cpf
    }

    return if CPF.valid?(self.cpf) and !cpfs.include? self.cpf

    errors.add(:cpf, :invalid)
  end

  def valid_cns
    return false unless self.cns.present?

    cns = self.cns
    digits = []

    return false if cns.length != 15

    for i in 0..15
      digits << cns[i].to_i * (15 - i)
    end

    errors.add(:cns, :invalid) unless (digits.sum % 11).zero?
  end

end
