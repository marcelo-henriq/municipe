class CitizenMailer < ApplicationMailer
  def notify_new_citizen(citizen_id)
    @citizen = Citizen.find(citizen_id)
    return if @citizen.blank?

    mail(to: @citizen.email, subject: t('common.notifications.new', model: @citizen.class.model_name.human) )
  end

  def notify_update_citizen(citizen_id)
    @citizen = Citizen.find(citizen_id)
    return if @citizen.blank?

    mail(to: @citizen.email, subject: t('common.notifications.updated', model: @citizen.class.model_name.human, param: @citizen.name) )
  end
end
