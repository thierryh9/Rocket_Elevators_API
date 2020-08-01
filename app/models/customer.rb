class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :building
  
  after_create :upload_lead_files 
  
  def upload_lead_files
	client = DropboxApi::Client.new(ENV["DROPBOX"])
	leads = Lead.where(email: self.email)
	puts "======================="

	
	leads.each do |l|
		if !l.entrepriseName.nil?
		begin
			client.get_metadata("/Relevator/#{l.entrepriseName}") 
			puts "found"
		rescue => exception
			client.create_folder("/Relevator/"+l.entrepriseName)
		end
		if l.file != nil
			begin
				client.get_metadata("/Relevator/#{l.entrepriseName}/#{l.fileName}") 
				puts "found"
			rescue => exception
				client.upload_by_chunks("/Relevator/#{l.entrepriseName}/#{l.fileName}",l.file)
			end
			#list = client.list_shared_links({path: "/Relevator/"+l.entrepriseName+"/"+l.fileName}).links
			#puts list[0].url
			#puts list.any?{|s| s.url == "/Relevator/#{l.entrepriseName}/#{l.fileName}"}
			begin				
				link = client.create_shared_link_with_settings("/Relevator/"+l.entrepriseName+"/"+l.fileName).url
			rescue => exception
				link = client.list_shared_links({path: "/Relevator/"+l.entrepriseName+"/"+l.fileName, direct_only: true}).links[0].url
			end
			l.update_attribute(:shareLink, link)
			l.update_attribute(:file, "")
			l.update_attribute(:fileName, "")
		end
	end
	end
	
  end
end
