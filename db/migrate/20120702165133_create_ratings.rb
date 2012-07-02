class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :user_id, :null => false
      t.integer :recipe_id, :null => false
      t.integer :stars
      t.timestamps
    end

    add_index :ratings, :recipe_id
  end

  def self.down
  	drop_table :ratings
  end
end
