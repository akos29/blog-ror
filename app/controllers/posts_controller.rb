class PostsController < ApplicationController
  before_action :find_post, only: [:like]

  def like
    @post.likes.create(author_id: current_user.id)
    # Like.create(author_id: current_user.id, post_id: @post.id)
    respond_to do |format|
      format.js { render json: { success: true } }
      format.html { redirect_to root_path }
    end
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    # @user = User.find(params[:user_id])
    @current_user = current_user
    post = Post.new(params.require(:post).permit(:title, :text).merge(author_id: @current_user.id))
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_path
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: }
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.order(:created_at)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
