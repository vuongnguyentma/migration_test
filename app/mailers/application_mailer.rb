class ApplicationMailer < ActionMailer::Base
  default from: 'baf2681995@sandbox357bc52210ac4c0a9fc9e9225c1f1d6c.mailgun.org'
  layout 'mailer'

  def new_record_notification(record)
    @record = record
    mail to: "recipient@sandbox357bc52210ac4c0a9fc9e9225c1f1d6c.mailgun.org", subject: "Success! You did it."
  end
end
