class CommentsController < ActionController::API
  def index
    post_id = params[:post_id]
    post = Post.find_by!(id: post_id)
    comment = post.comments.all
    render(json: comment)
  end

  def show
    id = params[:id]
    comment = Comment.find_by(id: id)
    render(json: comment)
    # Post.find_by(id: params[:id])
  end

  def create
    post_id = params[:post_id]
    post = Post.find_by!(id: post_id)
    comment = post.comments.new(comment_params)
    # comment = Comment.new(comment_params)
    # comment.post_id = post.id - line 16 replaces 17 + 18
    # comment.post = post - another way for line 18
    p comment
    if comment.save
     render(json: comment)
    else
      render(json: comment.errors.details, status: :unprocessable_entity)
    end
  end

  def update
    id = params[:id]
    comment = Comment.find_by(id: id)
    if comment.update(comment_params)
      render(json: comment)
    else
      render(json: comment.errors.details, status: :unprocessable_entity)
    end
  end

  def destroy
    id = params[:id]
    comment = Comment.find_by(id: id)
    comment.destroy
    render(json: comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
