class Building < ApplicationRecord
  belongs_to :address
  belongs_to :customer
  has_many :battery
  has_one :building_detail
  include RailsAdminWeather
  
  def self.data
	[
		name: "Weather",
		apiKey: ENV['2b23e7071c304d53b82160733203007']
	]
  end
end
