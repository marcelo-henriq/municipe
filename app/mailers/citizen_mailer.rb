class CitizenMailer < ApplicationMailer
  def notify_new_citizen(citizen)
    @citizen = citizen.decorate
    mail(to: [@citizen.email], subject: 'Novo cidadão incluido no sistema!' )
  end

  def notify_update_citizen(citizen)
    @citizen = citizen.decorate
    mail(to: [@citizen.email], subject: "Cidadão #{@citizen.name} atualizado no sistema!" )
  end
end
