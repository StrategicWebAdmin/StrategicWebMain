# app/mailers/contact_mailer.rb
class ContactMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']

  def send_contact_email(contact)
    @contact = contact

    mail(
      to: ENV['GMAIL_USERNAME'],
      subject: 'New Contact Form Submission'
    )
  end
end

