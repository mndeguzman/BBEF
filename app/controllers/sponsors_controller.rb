class SponsorsController < ApplicationController
  def index
  	@sponsors = Sponsor.find :all#.order("last_name").all
  end
end
