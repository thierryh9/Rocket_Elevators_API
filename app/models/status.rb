class Status < ApplicationRecord
    has_many :elevators
    has_many :batteries
    has_many :columns
end
