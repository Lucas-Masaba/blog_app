class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  after_save :update_comment_counter

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
