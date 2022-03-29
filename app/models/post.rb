class Post < ApplicationRecord
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'
  belongs_to :user, foreign_key: :user_id

  after_save :update_post_user_counter

  def recent_comments
    comments.last(5)
  end

  private

  def update_post_user_counter
    user.update(posts_counter: user.posts.count)
  end
end
