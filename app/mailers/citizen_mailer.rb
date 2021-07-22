class CitizenMailer < ApplicationMailer
  def notify_new_citizen(citizen_id)
    @citizen = Citizen.find(citizen_id)
    return unless @citizen.present?

    mail(to: [@citizen.email], subject: 'Novo cidadão incluido no sistema!' )
  end

  def notify_update_citizen(citizen_id)
    @citizen = Citizen.find(citizen_id)
    return unless @citizen.present?

    mail(to: [@citizen.email], subject: "Cidadão #{@citizen.name} atualizado no sistema!" )
  end
end
