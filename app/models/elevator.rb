require 'rubygems'
require 'twilio-ruby'
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
end
