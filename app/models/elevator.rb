class Elevator < ApplicationRecord
  belongs_to :column
  belongs_to :category
  belongs_to :type
end
