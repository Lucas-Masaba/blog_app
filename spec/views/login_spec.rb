require 'rails_helper'

RSpec.describe 'Log in process', type: :feature do
  describe 'login page with empty fields' do

    before :each do
      @user = User.new(name: 'lucas', photo: 'http://photo.com', bio: 'Hello rails',
        email: 'railstest84@gmail.com', password: '123456')
      visit users_index_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
    end
    
    it 'shows the right content' do
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_button('Log in')
    end

    it 'shows Invalid Email or password.' do
      expect(page).to have_content('Invalid Email or password.')
    end

  end

  describe 'login page with invalid fields' do

    before :each do
      @user = User.new(name: 'lucas', photo: 'http://photo.com', bio: 'Hello rails',
        email: 'railstest84@gmail.com', password: '123456')
      visit users_index_path
      fill_in 'Email', with: 'railstest84@gmail.com'
      fill_in 'Password', with: '45678'
      click_button 'Log in'
    end

    it 'shows Invalid Email or password.' do
      expect(page).to have_content('Invalid Email or password.')
    end

  end

  describe 'login page with valid fields' do

    before :each do
      @user = User.new(name: 'lucas', photo: 'http://photo.com', bio: 'Hello rails',
        email: 'railstest84@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save!
      visit users_index_path
      fill_in 'Email', with: 'railstest84@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'should redirect to users posts' do
      expect(page).to have_current_path '/users/index'
    end

  end


end
