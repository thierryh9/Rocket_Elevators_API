class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :building
  
  after_create :upload_lead_files
  
  
  
  def upload_lead_files
  
  end
end
