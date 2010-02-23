class Week < ActiveRecord::Base
  has_many :readings
  has_many :meals
  
  def self.for_date( date )
    Week.find( :first, :conditions => ['begins = ?',date.beginning_of_week] ) ||
      Week.create( :begins => date.beginning_of_week, :points_target => 420 )
  end
  
  def update_totals
    update_attribute( :points_used, meals.inject( 0.0 ) { |total,meal| total + meal.points_value } )
  end
  
  def to_param
    begins.strftime("%Y-%m-%d")
  end
  
end
