class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.date        :eaten_on, :null => false
      t.string      :description, :null => false
      t.integer     :kind, :null => false
      t.integer     :kcal
      t.integer     :fat
      t.integer     :points
      
      t.timestamps
    end
    
    add_index :meals, [:eaten_on]
    add_index :meals, [:kind]
  end

  def self.down
    drop_table :meals
  end
end
