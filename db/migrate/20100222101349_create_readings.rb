class CreateReadings < ActiveRecord::Migration
  def self.up
    create_table :readings do |t|
      t.date        :taken_on
      t.integer     :weight_in_grams
      
      t.timestamps
    end
  end

  def self.down
    drop_table :readings
  end
end
