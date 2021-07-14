class CitizenDecorator < ApplicationDecorator
  delegate_all

  def pretty_phonenumber
    "+#{object.phonenumber[0..1]} (#{object.phonenumber[2..3]})#{object.phonenumber[4..8]}-#{object.phonenumber[9..12]}"
  end

  def pretty_cpf
    CPF.new(object.cpf).formatted
  end
end
