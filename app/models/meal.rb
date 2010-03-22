class Meal < ActiveRecord::Base
  belongs_to :week
  
  named_scope :asc_sort, :order => 'description ASC'
  
  def self.for_day( date, kind = nil )
    if kind
      find( :all, :conditions => { :eaten_on => date, :kind => kind } )
    else
      find( :all, :conditions => { :eaten_on => date } )
    end
  end
  
  def self.points_for_day( date, kind = nil )
    for_day( date, kind ).inject( 0.0 ) { |total,meal| total+meal.points_value }
  end
  
  def after_save
    self.week.update_totals
  end
  
  def points_value
    if points
      points
    else
      (kcal.to_f / 35.0) + (fat.to_f / 2.5)
    end
  end
  
end
