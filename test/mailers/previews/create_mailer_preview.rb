# Preview all emails at http://localhost:3000/rails/mailers/create_mailer
class CreateMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/create_mailer/send_create_mail
  def send_create_mail
    CreateMailer.send_create_mail
  end

end
