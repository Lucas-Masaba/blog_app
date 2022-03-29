class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: :user_id

  def recent_comments
    comments.last(5)
  end

  def update_post_user_counter
    user.update(posts_counter: user.posts.count)
  end
end