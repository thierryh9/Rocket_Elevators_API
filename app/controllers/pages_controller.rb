class PagesController < ApplicationController


	require 'sendgrid-ruby'
	include SendGrid
	require 'zendesk_api'
	
  def home
  end
  def create
    
    cat = Category.where(:name => params[:gamme]).first
    building = Type.where(:name => params[:building]).first
    quote = Quote.create(companyName: params[:companyName],email: params[:email],floor: to_number(params[:floor]),basement: to_number(params[:basement]),apartment: to_number(params[:apartment]),business: to_number(params[:commerce]),shaft: to_number(params[:shafts]),companie: to_number(params[:companie]),parking: to_number(params[:parking]),ocupant: to_number(params[:occupant]),open: to_number(params[:time]), category: cat, type: building)
    quote.save()
    redirect_to controller: 'pages'
    
  end

  def to_number(string)
    Integer(string || '')
  rescue ArgumentError
    0
  end
  
  def createLead
	Lead.create(fullName: params[:contact][:name], entrepriseName: params[:contact][:entreprise], email: params[:contact][:email], cellPhone: params[:contact][:phone], projectName: params[:contact][:projectname], description: params[:contact][:describe], type: Type.where(:name => params[:contact][:department]).first, message: params[:contact][:message], file: params[:contact][:attachment].read, fileName: params[:contact][:attachment].original_filename)
	from = Email.new(email: 'alexlevesque7@hotmail.fr')
	to = Email.new(email: params[:contact][:email])
	subject = 'Greetings '+params[:contact][:name]
	content = Content.new(type: 'text/html', value: '<html><body><a href="http://www.relevator.ca" title="Rocket Elevators"><img src="http://www.relevator.ca'+ActionController::Base.helpers.image_url('R2-01.jpg')+'" alt="Rocket logo" /></a><br />We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project'+params[:contact][:projectname]+'. <br> A representative from our team will be in touch with you very soon. We look forward to demonstrate the value of our solutions and help you choose the appropriate product given your requirements.
We’ll Talk soon
The Rocket Team</body>
</html>')
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: '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')

  response = sg.client.mail._('send').post(request_body: mail.to_json)
  
  ZendeskAPI::Ticket.create!($client, :type => "task", :subject => " '#{params[:contact][:name]}' from #{params[:contact][:entreprise]}", :comment => { :value => "
      Comment: The contact '#{params[:contact][:name]}' from company '#{params[:contact][:entreprise]}'can be reached at email  '#{params[:contact][:email]}' and at 
      phone number #{params[:contact][:phone]}. #{params[:contact][:department]} has a project named #{params[:contact][:projectname]} which would require contribution from Rocket 
      Elevators. 
      #{params[:contact][:describe]}
      Attached Message: #{params[:contact][:message]}
      The Contact uploaded an attachment
      " },
      :priority => "urgent")
  end

  
  def download
   lead = Lead.where(:id => params[:id]).first
   send_data lead.file, filename: lead.fileName
  end
  
end

