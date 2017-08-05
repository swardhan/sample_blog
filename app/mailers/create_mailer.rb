class CreateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.create_mailer.send_create_mail.subject
  #
  def send_create_mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
