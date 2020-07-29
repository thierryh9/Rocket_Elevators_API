require 'twilio-ruby'

controller do

    every 1.hour do

        account_sid = ENV["twillio_sid"]
        auth_token =  ENV["twillio_token"]

        tech_contact = '+16029102771'
        tech_phone_number = '+15148095837'

        Elevator.find_each(:id, :serialNumber, :status, :column_id) do |elevator|

          if @elevator.status != 1
            sms = "The Elevator %i with Serial Number %s has changed status to %s" % [@elevator.id, @elevator.serial_number, @elevator.status]

            @client = Twilio::REST::Client.new account_sid, auth_token
            send_sms = @client.messages.create(
                body: sms,
                to: tech_phone_number,
                rom: tech_contact)
              puts send_sms.sid
          end
      end
    end
end
