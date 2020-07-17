class Type < ApplicationRecord
	has_many :quote
	has_many :elevator
	has_many :lead
end
