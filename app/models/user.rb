class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: true
  validates :posts_counter, length: { in: 0..100000 }

  def three_most_recent
    posts.last(3)
  end
end
