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
	content = Content.new(type: 'text/html', value: '<html><body><a href="http://www.relevator.ca" title="Rocket Elevators"><img src="'+ActionController::Base.helpers.image_url('R2.png')+'" alt="Rocket logo" /></a><br />We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project'+params[:contact][:projectname]+'. \n A representative from our team will be in touch with you very soon. We look forward to demonstrate the value of our solutions and help you choose the appropriate product given your requirements.
We’ll Talk soon
The Rocket Team</body>
</html>')
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: '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')
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	client = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://alexrockethelp.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

  # Basic / Token Authentication
  config.username = "alexlevesque7@hotmail.fr"

  # Choose one of the following depending on your authentication choice
  config.token = "TLUZ0rzfARdxS7J6zZBwdOOYfeWs1N91Mccmw6o9"
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
	
ZendeskAPI::Ticket.create!(client, :subject => "Test Ticket", :comment => { :value => "This is a test" }, :submitter_id => client.current_user.id, :priority => "urgent")
  end
  
  def download
   lead = Lead.where(:id => params[:id]).first
   send_data lead.file, filename: lead.fileName
  end
  
end

