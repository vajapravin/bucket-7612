require 'sendgrid-ruby'
class DeviseMailer < Devise::Mailer
  include SendGrid
  include SendgridHelper

  def confirmation_instructions(record, token, opts={})
    personalization = Personalization.new
    personalization.add_to(Email.new(email: record.email, name: 'Ariviga'))
    personalization.add_substitution(Substitution.new(key: '%confirmation_token%', value: "#{record.confirmation_token}"))
    send_mail(:welcome_and_verify_template, record.email, "Welcome to Ariviga", personalization)
  end
end