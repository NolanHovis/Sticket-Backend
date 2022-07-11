require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users/login' do

    post('login user') do

      tags 'Login User'
      consumes 'multipart/form-data'
      security [token: []]
      parameter name: :user, in: :formData, schema: {
        type: :object, 
        properties: {
          email: { type: :string, required: true, description: 'required', example: 'hello@gmail.com' },
          password: {type: :string, required: true, description: 'required', example: 'password12345' }
        },
        # required: %w[email password]
      }

      response(200, 'successful') do
        run_test!
      end

      response(401, 'bad credentials') do 
        run_test!
      end
    end
  end

  path '/api/v1/users/logout' do

    delete('logout user') do

      tags 'Logout User'
      consumes 'multipart/form-data'
      security [token: []]
      parameter name: :token, in: :header, schema: {
        type: :object,
        properties: {},
        required: %w[]
      }

      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/users/me' do

    get('me user') do
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/users/create' do

    post('create user') do

      tags 'See User'
      consumes 'multipart/form-data'
      security [token: []]
      parameter name: :user, in: :formData, schema: {
        type: :object, 
        properties: {
          email: { type: :string, required: true, description: 'required', example: 'hello@gmail.com' }
        },
        required: %w[email]
      }
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
