class IndexCommentsOnRecipeId < ActiveRecord::Migration
  def up
  	add_index :comments, [:recipe_id]
  end

  def down
  	remove_index :comments, [:recipe_id]
  end
end
