class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @users = User.find(params[:id])
    @recent_posts = Post.where(author_id: id)
  end
end
