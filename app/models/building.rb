class Building < ApplicationRecord
  belongs_to :address
  belongs_to :customer
  has_many :battery
  has_one :building_detail
  include RailsAdminWeather
  
  def self.data
	[
		name: "Weather",
		apiKey: ENV['WEATHER']
	]
  end
end
