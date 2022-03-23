require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'Is the response status correct' do
      expect(response).to have_http_status(200)
    end

    it 'Is the correct template rendered' do
      expect(response).to render_template('index')
    end

    it 'Does the body include the correct text' do
      expect(response.body).to include('This is the Users#index page.')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/:id' }

    it 'Is response status correct' do
      expect(response).to have_http_status(200)
    end

    it 'Is the correct template rendered' do
      expect(response).to render_template('show')
    end

    it 'Does the body include correct text' do
      expect(response.body).to include('This is the Users#shows page.')
    end
  end
end