class PagesController < ApplicationController
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
  end
  
  def download
   lead = Lead.where(:id => params[:id]).first
   send_data lead.file, filename: lead.fileName
  end
  
end

