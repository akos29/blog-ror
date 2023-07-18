require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  user = User.create(name: 'Abebe', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                     bio: 'Teacher from Mexico.')

  subject { Post.new(author: user, title: 'About Rais Rspec', text: 'Hello Rspec request') }

  before { subject.save }

  describe 'GET #index' do
    it 'displays all posts' do
      get "/users/#{user.id}/posts"

      expect(response).to have_http_status(200)
      expect(response.body).to include(user.name)
      expect(response.body).to include(subject.title)
    end
  end

  describe 'GET index template' do
    before { get "/users/#{user.id}/posts/", params: { format: :html } }
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
  describe 'GET #show' do
    it 'displays all posts' do
      get "/users/#{user.id}/posts/#{subject.id}"

      expect(response).to have_http_status(200)
      expect(response.body).to include(subject.text)
      expect(response).to render_template(:show)
    end
  end
end
