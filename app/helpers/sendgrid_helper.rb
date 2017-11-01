require 'sendgrid-ruby'
module SendgridHelper
  include SendGrid

  def send_mail(template_id, receipient_ids, subject, personalization)
    sendgrid = YAML.load_file("#{Rails.root}/config/sendgrid.yml")

    mail = Mail.new
    mail.from = Email.new(email: 'contact@thatch.ie')
    mail.subject = subject
    mail.add_personalization(personalization)
    mail.template_id = sendgrid[Rails.env][template_id.to_s]
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    begin
      response = sg.client.mail._("send").post(request_body: mail.to_json)
    rescue Exception => e
      puts e.message
    end
  end
end