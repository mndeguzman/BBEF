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
    if @sponsor.save
        flash[:success] = "Your sponsor has been created"
        redirect_to sponsors_path
      else
        flash[:error] = "Your sponsor has not been created"
        render 'new'
      end
  end

  def show
  end

  def edit
  end

  def update
    if @sponsor.update_attributes(params[:sponsor])
        flash[:success] = "The details of your sponosr have been saved"
        redirect_to sponsor_path(@sponsor.id)
      else
        flash[:error] = "Your sponsor has not been created"
        render 'edit'
      end
  end



  private
  def find_sponsor
       @sponsor = Sponsor.find(params[:id]) if params[:id]
  end

end
