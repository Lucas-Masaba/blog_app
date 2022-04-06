class Post < ApplicationRecord
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, dependent: :destroy, foreign_key: 'post_id'
  belongs_to :user, foreign_key: :user_id

  after_save :update_post_user_counter
  after_destroy :update_post_user_counter

  validates :title, presence: true, length: { maximum: 250 }

  def recent_comments
    comments.last(5)
  end

  private

  def update_post_user_counter
    user.update(posts_counter: user.posts.count)
  end
end
