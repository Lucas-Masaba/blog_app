class Like < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  def update_like_counter
    post.update(likes_counter: post.likes.count)
  end
end