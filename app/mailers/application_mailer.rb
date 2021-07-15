class ApplicationMailer < ActionMailer::Base
  add_template_helper(MailerHelper)

  default from: 'mhenrique.dev@gmail.com'
  layout 'mailer'
end
