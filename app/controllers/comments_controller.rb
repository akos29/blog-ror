class CommentsController < ApplicationController
  def index
    redirect_to user_posts_path
  end

  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    @current_user = current_user
    comment = Comment.new(params.require(:comment).permit(:post_id, :text).merge(author_id: @current_user.id))
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully'
          redirect_to user_posts_path
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          render :new, locals: { comment: }
        end
      end
    end
  end
end
