class Lead < ApplicationRecord
  belongs_to :type

  def file_link
    %{<a href="/fileLeads/#{self.id}">Download file</a>}.html_safe
  end
  def file_dropbox
    %{<a href="#{self.shareLink}">DropBox file</a>}.html_safe
  end

  rails_admin do
    configure :file_link do
		visible false # so it's not on new/edit 
		
	end
	configure :file_dropbox do
        visible false # so it's not on new/edit
	end
    list do
      field :file_link
	  field :file_dropbox
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
	  field :file_dropbox
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
