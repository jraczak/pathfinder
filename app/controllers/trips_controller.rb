class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end
  
  def show
    @trip = Trip.find(params[:id])
  end
  
  def new
    @trip = Trip.new
  end
  
  def create
    @trip = Trip.create(params[:trip])
    
    redirect_to @trip
  end
  

end
