class Recipe < ActiveRecord::Base
  attr_accessible :cook_time, :description, :directions, :ingredients, :prep_time, :recipe_name, :image
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :user_id, presence: true

  default_scope order: 'recipes.created_at DESC'
end
