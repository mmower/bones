class WeeksController < ApplicationController
  
  def index
    @weeks = Week.find( :all, :order => 'begins DESC' )
  end
  
end
