class CitizenDecorator < ApplicationDecorator
  delegate_all

  def pretty_phonenumber
    "+#{object.country_code} (#{object.phonenumber[0..1]})#{object.phonenumber[2..6]}-#{object.phonenumber[7..10]}"
  end

  def pretty_cpf
    CPF.new(object.cpf).formatted
  end
end
