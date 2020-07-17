class Battery < ApplicationRecord
  belongs_to :type
  belongs_to :employee
  belongs_to :building
  has_many :column
end
