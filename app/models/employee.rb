class Employee < ApplicationRecord
  belongs_to :user
  has_many :battery
end
