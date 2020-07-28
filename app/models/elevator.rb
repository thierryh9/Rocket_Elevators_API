#require 'send_sms/sms'
require 'slack-notifier'
require 'dotenv'
class Elevator < ApplicationRecord
  belongs_to :column
  belongs_to :category
  belongs_to :type

  after_update :send_sms, if: :intervention?
   
    
    before_update :slack_notifier

    def slack_notifier
        if self.status_changed?
          require 'date'
          current_time = DateTime.now.strftime("%d-%m-%Y %H:%M")
          notifier = Slack::Notifier.new'https://hooks.slack.com/services/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'  do
            defaults channel: "#Thierry_Harvey"
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

    # def intervention?
    #     self.status == "Intervention"
    # end
end
