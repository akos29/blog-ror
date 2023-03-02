class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @users = User.find(params[:id])
    @recent_posts = Post.where(author_id: self.id)
  end

  def edit
    # @users = User.find(params[:id])
  end

  def show_recent_post
    # @recent_posts = Post.where(author_id: self.id)
  end
end
