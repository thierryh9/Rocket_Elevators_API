class Lead < ApplicationRecord
  belongs_to :type

  def file_link
    %{<a href="/fileLeads/#{self.id}">Download file</a>}.html_safe
  end

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
