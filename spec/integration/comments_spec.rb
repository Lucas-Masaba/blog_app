require 'swagger_helper'
# require 'rspec'


RSpec.describe 'Comments API' do

  path 'api/comments' do

    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string },
        },
        required: [ 'text' ]
      }

      response '201', 'comment created' do
        let(:post) { { text: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:pet) { 'invalid' } 
        run_test!
      end
    end
  end

  path 'comments/{id}' do

    get 'Retrieves a comment' do
      tags 'Comments'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            text: { type: :string },
          },
          required: [ 'text' ]

        let(:id) { Comment.create(text: 'foo') }
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end