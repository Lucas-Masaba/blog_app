require 'swagger_helper'

RSpec.describe 'Posts API' do

  path 'api/posts' do

    post 'Creates a post' do
      tags 'Posts'
      consumes 'application/json', 'application/xml'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :string },
        },
        required: [ 'title', 'text' ]
      }

      response '201', 'post created' do
        let(:post) { { title: 'Dodo', text: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:pet) { { title: 'foo' } }
        run_test!
      end
    end
  end

end