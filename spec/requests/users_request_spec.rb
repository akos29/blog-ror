require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET index template' do
    before { get '/users', params: { format: :html } }

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #index' do
    it 'displays all users' do
      user1 = User.create(name: 'Abebe', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                          bio: 'Teacher from Mexico.')
      user2 = User.create(name: 'Abebe', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                          bio: 'Teacher from Mexico.')

      get users_path

      expect(response).to have_http_status(200)
      expect(response.body).to include(user1.name)
      expect(response.body).to include(user2.name)
    end
  end
  describe 'GET #show' do
    it 'displays all users' do
      user1 = User.create(name: 'Abebe', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                          bio: 'Teacher from Mexico.')

      get "/users/#{user1.id}"

      expect(response).to have_http_status(200)
      expect(response.body).to include(user1.name)
      expect(response).to render_template(:show)
    end
  end
end
