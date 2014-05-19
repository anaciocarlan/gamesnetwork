class LocationsController < ApplicationController

def new
end

def create
  @location = Location.new(params[:location])
  if @location.save
	redirect_to root_url, :notice => "Location Saved!"
  else
	render "new"
  end
end
  
end
