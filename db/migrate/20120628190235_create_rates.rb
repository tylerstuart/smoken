class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.string :rateable_type
      t.integer :stars
      t.string :dimension

      t.timestamps
    end

    add_index :rates, [:user_id, :recipe_id]
  end

  def self.down
    drop_table :rates
  end
end
