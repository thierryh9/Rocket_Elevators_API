class Lead < ApplicationRecord
  belongs_to :type
  def file_link
    %{<a href="/fileLeads/#{self.id}">Download file</a>}.html_safe
  end

  after_save :create_lead_ticket

    def create_lead_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "#{self.full_name} from #{self.company_name}", 
            :comment => { 
                :value => "The contact #{self.full_name} 
                    from company #{self.company_name} 
                    can be reached at email  #{self.email} 
                    and at phone number #{self.phone}. 
                    #{self.department} has a project named #{self.project_name} which would require contribution from Rocket Elevators.
                    \n\n
                    Project Description
                    #{self.project_desc}\n\n
                    Attached Message: #{self.message}"
            }, 
            :requester => { 
                "name": self.full_name, 
                "email": self.email 
            },
            :priority => "normal",
            :type => "question"
            )
    end

  rails_admin do
    configure :file_link do
        visible false # so it's not on new/edit 
    end
	
    list do
      field :file_link
	  field :fullName
	  field :entrepriseName
	  field :email
	  field :cellPhone
	  field :projectName
	  field :description
	  field :division
	  field :message
    end

    show do
	
      field :file_link
	  field :fullName
	  field :entrepriseName
	  field :email
	  field :cellPhone
	  field :projectName
	  field :description
	  field :division
	  field :message
    end
  end
end
