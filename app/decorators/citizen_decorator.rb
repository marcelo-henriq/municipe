class CitizenDecorator < ApplicationDecorator
  delegate_all

  def pretty_phonenumber
    "+#{object.country_code} (#{object.phonenumber[0..1]})#{object.phonenumber[2..6]}-#{object.phonenumber[7..10]}"
  end

  def pretty_cpf
    CPF.new(object.cpf).formatted
  end

  def birth_date_localized
    return t('common.empty') unless object.birth_date.present?

    l(object.birth_date)
  end

  def statuses
    CitizenStatus.to_a
  end
end
