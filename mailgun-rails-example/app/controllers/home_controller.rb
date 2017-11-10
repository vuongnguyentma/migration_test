class HomeController < ApplicationController
  def index
  end

  def create

    # Get message value from form
    @message = params





    # Check if SMTP
    if @message[:mode] == "SMTP"

      # Tell notifier action mailer to send via SMTP
      Notifier.send_email(@message).deliver

      # Redirect on success
      redirect_to root_path, notice: 'Message was sent via SMTP.'




    # Else send via API
    else
      require 'openssl'
      # TODO note why we disabled verification
      # OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
      # First, instantiate the Mailgun Client with your API key
      mg_client = Mailgun::Client.new 'key-c7c55885a649662e85ac1a86a25dc455'

      # Define your message parameters
      html_output = render_to_string template: "notifier/send_email"
      message_params = {:from    => 'Mailgun Test Project <test@mailgun.quine.be>',
                        :to      => @message[:to],
                        :subject => 'Mailgun message via API',
                        :text    => @message[:body],
                        :html    => html_output.to_str,
                        "o:tag"  => 'test',
                        :verify_ssl =>false}

      # Send your message through the client
      mg_client.send_message 'mailgun.quine.be', message_params

      # Redirect on success
      redirect_to root_path, notice: 'Message was sent via API.'
    end
  end
end
