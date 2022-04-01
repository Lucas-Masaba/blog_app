require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/:id/posts' }

    it 'Is the response status correct' do
      expect(response).to have_http_status(200)
    end

    it 'Is the correct template rendered' do
      expect(response).to render_template('index')
    end

    # it 'Does the body include correct text' do
    #   expect(response.body).to include('This is the Posts#index page.')
    # end
  end

  describe 'GET /show' do
    before(:example) { get '/users/:id/posts/:id' }

    it 'Is the response status correct' do
      expect(response).to have_http_status(200)
    end

    it 'Is the correct template rendered' do
      expect(response).to render_template('show')
    end

    # it 'Does the body include correct text' do
    #   expect(response.body).to include('This is the Posts#shows page.')
    # end
  end
end
