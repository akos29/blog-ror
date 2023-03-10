module ApplicationHelper
  def liked?(author_id, post_id)
    post = Post.find_by(id: post_id)
    author = User.find_by(id: author_id)
    liked = Like.where(author:, post:)

    liked.present?
  end
end
