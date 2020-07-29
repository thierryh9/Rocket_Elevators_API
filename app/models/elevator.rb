
require 'rubygems'
require 'twilio-ruby'

#require 'send_sms/sms'
require 'slack-notifier'
require 'dotenv'

class Elevator < ApplicationRecord
  belongs_to :column
  belongs_to :category
  belongs_to :type

  before_save:notify_tech

  def notify_tech
    if self.status_changed?
      account_sid = ENV["TWILIO_ACCOUNT_SID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      rocketElevAlert = ENV["TWILIO_FROM"],
      tech_phone_number = '+15148095837'
      sms_body = "The Elevator %i with Serial Number %s needs an intervention" % [self.id, self.serialNumber]
      if self.status_was != '0'
         @client.messages.create(
          from: rocketElevAlert,
          to: tech_phone_number, #self.column.battery.building.technician_phone,
          body: sms_body)
      end
    end
  end


  after_update :send_sms, if: :intervention?
   
    
    before_update :slack_notifier

    def slack_notifier
      #puts ENV["Slack_Webhook_URL"]
        if self.status_changed?
          require 'date'
          current_time = DateTime.now.strftime("%d-%m-%Y %H:%M")
          notifier = Slack::Notifier.new ENV["Slack_Webhook_URL"]  do
            defaults channel: "#elevator_operations"
          end
          notifier.ping "The Elevator #{self.id} with Serial Number #{self.serialNumber} changed status from #{self.status_was} to #{self.status} at #{current_time}."
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
