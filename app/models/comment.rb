class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :recipe

  validates :content, presence: true, length: {maximum: 5000}
  validates :user_id, presence: true

  default_scope order: 'comments.created_at DESC'

end
