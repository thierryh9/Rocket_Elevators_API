class Lead < ApplicationRecord
  belongs_to :type
  require 'zendesk_api'
  def file_link
    %{<a href="/fileLeads/#{self.id}">Download file</a>}.html_safe
  end

  after_save :create_lead_ticket

  def create_lead_ticket

    client = ZendeskAPI::Client.new do |config|
    # Mandatory:
  
    config.url = "https://rocketelevators7.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
  
    # Basic / Token Authentication
    config.username = "thierryh9@gmail.com"
  
    # Choose one of the following depending on your authentication choice
    config.token = "0uSkLGLqUN9vAwypvb3wXGl9QJBQFAMTPkMz0hus"
    #config.password = "your zendesk password"
  
    # OAuth Authentication
    #config.access_token = "your OAuth access token"
  
    # Optional:
  
    # Retry uses middleware to notify the user
    # when hitting the rate limit, sleep automatically,
    # then retry the request.
    config.retry = true
  
    # Raise error when hitting the rate limit.
    # This is ignored and always set to false when `retry` is enabled.
    # Disabled by default.
    config.raise_error_when_rate_limited = false
  
    # Logger prints to STDERR by default, to e.g. print to stdout:
    require 'logger'
    config.logger = Logger.new(STDOUT)
  
    # Changes Faraday adapter
    # config.adapter = :patron
  
    # Merged with the default client options hash
    # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}
  
    # When getting the error 'hostname does not match the server certificate'
    # use the API at https://yoursubdomain.zendesk.com/api/v2
   
  end
  #ZendeskAPI::Ticket.create!(client, :subject => "Test Ticket", :comment => { :value => "This is a test" }, :submitter_id => client.current_user.id, :priority => "urgent")
  # ZendeskAPI::Ticket.create!(client, 
  #             :subject => "#{params[:contact][:name]} from #{self.contact.entreprise}", 
  #             :comment => { 
  #                 :value => "The contact #{self.fullName} 
  #                     from company #{self.entrepriseName} 
  #                     can be reached at email  #{self.email} 
  #                     and at phone number #{self.cellPhone}. 
  #                     #{self.type_id} has a project named #{self.projectName} which would require contribution from Rocket Elevators.
  #                     \n\n
  #                     Project Description
  #                     #{lead.description}\n\n
  #                     Attached Message: #{self.message}"
  #             }, 
  #             :requester => { 
  #                 "name": self.fullName, 
  #                 "email": self.email 
  #             },
  #             :priority => "normal",
  #             :type => "question"
  #             ) 
  
end
  
      
  # end
  
  


  rails_admin do
    configure :file_link do
        visible false # so it's not on new/edit 
    end
	
    list do
      field :file_link
	  field :shareLink
	  field :fullName
	  field :entrepriseName
	  field :email
	  field :cellPhone
	  field :projectName
	  field :description
	  field :message
    end

    show do
	
      field :file_link
	  field :shareLink
	  field :fullName
	  field :entrepriseName
	  field :email
	  field :cellPhone
	  field :projectName
	  field :description
	  field :message
    end
  end
end
