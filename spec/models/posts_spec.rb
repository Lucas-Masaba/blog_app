require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(user: User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0), title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater_than_or_equal zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater_than_or_equal zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  it 'five_most_recent_comments should return a right result' do
    subject.comments.create(text: 'This is my first comment')
    subject.comments.create(text: 'This is my first comment')
    subject.comments.create(text: 'This is my first comment')
    subject.comments.create(text: 'This is my first comment')
    subject.comments.create(text: 'This is my first comment')
    subject.comments.create(text: 'This is my first comment')
    subject.comments.create(text: 'This is my first comment')
    expect(subject.recent_comments.count).to eq(5)
  end

  it 'update_post_user_counter should return a right result when calling it with after_save' do
    expect(subject.user.posts_counter).to eq(1)
  end
end
