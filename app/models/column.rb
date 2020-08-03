class Column < ApplicationRecord
  belongs_to :battery
  has_many :elevator
  belongs_to :status
end
