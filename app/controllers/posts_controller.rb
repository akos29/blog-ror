class PostsController < ApplicationController
  before_action :find_post, only: [:like]

  def like
    @post.likes.create(author_id: current_user.id)
    respond_to do |format|
      format.js { render json: { success: true } }
      format.html { redirect_to root_path }
    end
  end

  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts unless @user.nil?
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
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
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
  end
end
