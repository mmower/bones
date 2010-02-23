class CreateWeeks < ActiveRecord::Migration
  def self.up
    create_table :weeks do |t|
      t.date      :begins, :null => false
      
      t.integer   :points_target
      t.integer   :points_used
      
      t.timestamps
    end
    
    add_column :readings, :week_id, :integer
    Reading.reset_column_information
    Reading.all.each do |reading|
      reading.week = Week.for_date( reading.taken_on )
      reading.save!
    end
    
    add_column :meals, :week_id, :integer
    Meal.reset_column_information
    
    Meal.all.each do |meal|
      meal.week = Week.for_date( meal.eaten_on )
      meal.save!
    end
  end
  
  def self.down
    remove_column :readings, :week_id
    remove_column :meals, :week_id
    drop_table :weeks
  end
end
