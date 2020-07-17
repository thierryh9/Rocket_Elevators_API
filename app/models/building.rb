class Building < ApplicationRecord
  belongs_to :address
  belongs_to :customer
  has_many :battery
  has_one :building_detail
end
