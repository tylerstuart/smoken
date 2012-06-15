class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :description
      t.string :ingredients
      t.string :directions
      t.string :prep_time
      t.string :cook_time
      t.integer :user_id

      t.timestamps
    end
    add_index :recipes, [:user_id, :created_at]
  end
end
