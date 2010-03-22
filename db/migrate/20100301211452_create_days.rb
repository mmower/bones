class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.date        :recorded
      
      t.integer     :weight_in_grams
      
      t.boolean     :qi_gong
      t.boolean     :vitamins
      t.boolean     :fish_oil
      t.boolean     :water
      
      t.timestamps
    end
  end

  def self.down
    drop_table :days
  end
end
