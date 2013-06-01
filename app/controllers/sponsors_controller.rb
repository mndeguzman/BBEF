class SponsorsController < ApplicationController
  def index
  	@sponsors = Sponsor.order("last_name").all
  end
end
