require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  describe 'view page content' do
    before :each do
      @photo = 'http://photo.com'
      @user = User.new(name: 'lucas', photo: @photo, bio: 'Hello rails',
                       email: 'railstest84@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save!
      @post1 = Post.create(title: 'title1', text: 'body1', user_id: @user.id)
      @post2 = Post.create(title: 'title2', text: 'body2', user_id: @user.id)
      @post3 = Post.create(title: 'title3', text: 'body3', user_id: @user.id)
      @post4 = Post.create(title: 'title4', text: 'body4', user_id: @user.id)
      visit new_user_session_path
      fill_in 'Email', with: 'railstest84@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users'
      visit "/users/#{@user.id}"
    end

    it 'shows the right content' do
      expect(page).to have_css("img[src='http://photo.com']")
      expect(page).to have_content('lucas')
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('Hello rails')
      expect(page).to have_link('See All Posts')
    end

    it 'redirects to users first three posts' do
      visit "/users/#{@user.id}"
      expect(page).to have_content('body2')
      expect(page).to have_content('body3')
      expect(page).to have_content('body4')
    end

    it 'redirects to view all of user posts' do
      click_link 'See All Posts'
      expect(page).to have_current_path "/users/#{@user.id}/posts"
      expect(page).to have_content('body1')
      expect(page).to have_content('body2')
      expect(page).to have_content('body3')
      expect(page).to have_content('body4')
      # expect(page).to have_content('body5')
    end

    it 'redirects to view posts show page' do
      click_link "Post ##{@post4.id}"
      expect(page).to have_current_path "/users/#{@user.id}/posts"
    end
  end
end
