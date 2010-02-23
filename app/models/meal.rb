class Meal < ActiveRecord::Base
  belongs_to :week
  
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
