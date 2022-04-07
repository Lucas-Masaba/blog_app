require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  describe 'view page content' do
    before :each do
      @photo = 'http://photo.com'
      @user = User.new(name: 'lucas', photo: @photo, bio: 'Hello rails',
                       email: 'railstest84@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save!
      @user2 = User.new(name: 'Luis', photo: @photo, bio: 'Hello rails 2',
                        email: 'railstest85@gmail.com', password: '123456')
      @user2.skip_confirmation!
      @user2.save!
      @post1 = Post.create(title: 'title1', text: 'body1', user_id: @user.id)
      @post2 = Post.create(title: 'title2', text: 'body2', user_id: @user.id)
      @post3 = Post.create(title: 'title3', text: 'body3', user_id: @user.id)
      @post4 = Post.create(title: 'title4', text: 'body4', user_id: @user.id)
      @comment1 = @post1.comments.create!(user_id: @user.id, text: 'test comment 1')
      @comment2 = @post1.comments.create!(user_id: @user.id, text: 'test comment 2')
      @comment3 = @post1.comments.create!(user_id: @user2.id, text: 'test comment 3')
      @comment4 = @post1.comments.create!(user_id: @user2.id, text: 'test comment 4')
      visit users_index_path
      fill_in 'Email', with: 'railstest84@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit "/users/#{@user.id}/posts"
    end

    it 'shows the right content' do
      expect(page).to have_css("img[src='http://photo.com']")
      expect(page).to have_content('title1')
      expect(page).to have_content('lucas')
      expect(page).to have_content('Luis')
      expect(page).to have_content('body1')
      expect(page).to have_content('test comment 1')
      expect(page).to have_content('Comments: 4')
      expect(page).to have_content('Likes: 0')
    end
  end
end
