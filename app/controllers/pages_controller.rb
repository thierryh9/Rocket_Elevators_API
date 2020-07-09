class PagesController < ApplicationController
  def home
  end
  def create
    
    cat = Category.where(:name => params[:gamme]).first
    building = Type.where(:name => params[:building]).first
    quote = Quote.create(floor: to_number(params[:floor]),basement: to_number(params[:basement]),apartment: to_number(params[:apartment]),business: to_number(params[:commerce]),shaft: to_number(params[:shafts]),companie: to_number(params[:companie]),parking: to_number(params[:parking]),ocupant: to_number(params[:occupant]),open: to_number(params[:time]), category: cat, type: building)
    quote.save()
    redirect_to controller: 'pages'
  end

  def to_number(string)
    Integer(string || '')
  rescue ArgumentError
    0
  end
end

