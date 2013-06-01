class SponsorsController < ApplicationController
  def index
  	@sponsors = Sponsor.order("last_name").all
  end

  def new
  	@sponsor = Sponsor.new
  end	

  def create
  	@sponsor = Sponsor.new(params[:sponsor])
  	@sponsor.save
  	redirect_to sponsors_path
  end		

end
