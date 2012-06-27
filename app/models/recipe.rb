class Recipe < ActiveRecord::Base
  attr_accessible :cook_time, :description, :directions, :ingredients, :prep_time, :recipe_name, :image
  belongs_to :user
  has_many :comments, dependent:  :destroy

  mount_uploader :image, ImageUploader

  validates :user_id, presence: true

  default_scope order: 'recipes.created_at DESC'

    def feed
     Comment.where("recipe_id = ?", id)
    end
end
