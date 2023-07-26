require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) do
    User.first
  end
  let(:post) { Post.create(text: 'Hi', title: 'bye', author_id: user.id) }

  describe 'GET /new' do
    it 'returns http success' do
      get "/users/#{user.id}/posts/#{post.id}/comments/new"
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'GET /create' do
  #   it 'returns http success' do
  #     get '/comments/create'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
