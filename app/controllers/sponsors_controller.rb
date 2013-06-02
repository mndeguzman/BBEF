class SponsorsController < ApplicationController
  before_filter :find_sponsor

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

  def show
  end 

  def edit
  end     

  def update
      @sponsor.update_attributes(params[:sponsor])
      redirect_to sponsor_path(@sponsor.id)
  end   

  

  private 
  def find_sponsor
       @sponsor = Sponsor.find(params[:id]) if params[:id]
  end

end
