class Rating < ActiveRecord::Base
  attr_accessible :recipe_id, :stars, :user_id
end
