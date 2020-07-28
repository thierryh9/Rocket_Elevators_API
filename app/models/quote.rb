class Quote < ApplicationRecord
  belongs_to :type
  belongs_to :category

  after_save :create_quote_ticket

  def create_quote_ticket
      client = ZendeskAPI::Client.new do |config|
          config.url = 'https://rocketelevators7.zendesk.com/api/v2'
          config.username = "thierryh9@gmail.com"
          config.token = "0uSkLGLqUN9vAwypvb3wXGl9QJBQFAMTPkMz0hus"
      end
      ZendeskAPI::Ticket.create!(client, 
          :subject => "#{self.fullName} from #{self.companyName}", 
          :comment => { 
              :value => "The contact #{self.Full_Name} from company #{self.Company_Name} 
                  can be reached at email #{self.Email} and at phone number #{self.Phone_Number}. 
                  Building type selected is #{self.Building_Type} with product line #{self.Product_Grade}. 
                  Number of suggested elevator is #{self.Nb_Ele_Suggested} and total price is #{self.Final_Price}. \n
                  For More Information, refers to Quote ##{self.id}."
          }, 
          :requester => { 
              "name": self.Full_Name, 
              "email": self.Email 
          },
          :priority => "normal",
          :type => "task"
          )
  end
end
