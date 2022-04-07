require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  describe 'view page content' do
    before :each do
      @photo = 'http://photo.com'
      @user = User.new(name: 'lucas', photo: @photo, bio: 'Hello rails',
                       email: 'railstest84@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'Email', with: 'railstest84@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users'
    end

    it 'shows the right content' do
      expect(page).to have_css("img[src='http://photo.com']")
      expect(page).to have_content('lucas')
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_button('Sign Out')
    end

    it 'shows username for all other users' do
      expect(page).to have_css("span")
    end

    it 'redirects to the users show page' do
      click_link "Name: lucas"
      expect(page).to have_current_path "/users/#{@user.id}"
    end
    
    it 'redirects to users posts' do
      visit "/users/#{@user.id}"
      expect(page).to have_current_path "/users/#{@user.id}"
    end
  end
end
