class ReadingsController < ApplicationController
  
  def index
    @readings = Reading.all
  end
  
  def show
    @reading = Reading.find_by_id( params[:id] )
  end
  
  def new
    @reading = Reading.new
    @reading.taken_on = Date.today
  end
  
  def create
    @reading = Reading.create( params[:reading] )
    redirect_to readings_path
  end
  
  def edit
    @reading = Reading.find_by_id( params[:id] )
  end
  
  def update
    @reading = Reading.find_by_id( params[:id] )
    @reading.update_attributes( params[:reading] )
    redirect_to reading_path( @reading )
  end
  
end
