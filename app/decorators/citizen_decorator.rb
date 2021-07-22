class CitizenDecorator < ApplicationDecorator
  delegate_all

  def pretty_phonenumber
    "+#{object.country_code} (#{object.phonenumber[0..1]})#{object.phonenumber[2..6]}-#{object.phonenumber[7..10]}"
  end

  def pretty_cpf
    CPF.new(object.cpf).formatted
  end

  def pretty_cns
    "#{object.cns[0..2]} #{object.cns[3..6]} #{object.cns[7..10]} #{object.cns[11..12]}-#{object.cns[13..14]}"
  end

  def birth_date_localized
    return t('common.empty') unless object.birth_date.present?

    l(object.birth_date)
  end

  def pretty_address
    "#{object.address.neighborhood}, #{object.address.residencial_number} | #{object.address.city}."
  end

  def age
    ((Time.zone.now - object.birth_date.to_time) / 1.year.seconds).floor
  end

  def statuses
    CitizenStatus.to_a
  end
end
