require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(
      post: Post.new(
        user: User.new(
          name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
          bio: 'Teacher from Mexico.',
          posts_counter: 0
        ), title: 'Hello', text: 'This is my first post',
        likes_counter: 0, comments_counter: 0
      ),
      user: User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
    )
  end

  before { subject.save }

  it 'update_post_like_counter should return a right result when calling it with after_save' do
    expect(subject.post.likes_counter).to eq(1)
  end
end