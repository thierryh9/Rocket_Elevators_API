
# require 'rubygems'
# require 'twilio-ruby'

#require 'send_sms/sms'
require 'slack-notifier'
require 'dotenv'

class Elevator < ApplicationRecord
  belongs_to :column
  belongs_to :category
  belongs_to :type
  belongs_to :status

  before_save:notify_tech

  def notify_tech
    if self.status_id_changed?
      account_sid = ENV["TWILIO_ACCOUNT_SID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      rocketElevAlert = ENV["TWILIO_FROM"]
      tech_phone_number = ENV["TWILIO_TO"]
      sms_body = "The Elevator #{self.id} with Serial Number #{self.serialNumber} needs an intervention"
      if self.status_id_was != Status.find_by(name: "intervention")
         @client.messages.create(
          from: ENV["TWILIO_FROM"],
          to: tech_phone_number, #self.column.battery.building.techPhone,
          body: sms_body)
      end
    end
  end


  after_update :send_sms, if: :intervention?
   
    
    before_update :slack_notifier

    def slack_notifier

        if self.status_id_changed?
          require 'date'
          current_time = DateTime.now.strftime("%d-%m-%Y %H:%M")
          notifier = Slack::Notifier.new ENV["Slack_Webhook_URL"]  do
            defaults channel: "#elevator_operations"
          end
          notifier.ping "The Elevator #{self.id} with Serial Number #{self.serialNumber} changed status from #{Status.find_by(id: self.status_id_was).name} to #{Status.find_by(id: self.status_id).name} at #{current_time}."
    end
         
    
    
        
    end
    

    # def send_sms()
    #     tech = self.column.battery.building.techName
    #     id = self.id
    #     sn = self.serialNumber
    #     status = self.status
    #     sms = SendSms::Sms.new
    #     sms.send_sms(tech, id, sn, status)
    # end

     def intervention?
         self.status == "Intervention"
     end

end
