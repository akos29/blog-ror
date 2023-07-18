class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    # render :new
  end
  def show
    @user = User.find(params[:id])
    # @posts = @user.show_recent_posts
  end

  def show_recent_posts
    @user = User.find(params[:id])
    @posts = @user.posts.first(3)
  end

  def show_recent_comments
    @user = User.find(params[:id])
    @comments = @user.comments.first(3)
  end

  def show_recent_likes
    @user = User.find(params[:id])
    @likes = @user.likes.first(3)
  end

end
