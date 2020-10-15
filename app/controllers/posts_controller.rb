class PostsController < ActionController::API
  def index
    render(json: Post.all)
  end

  def show
    id = params[:id]
    post = Post.find_by(id: id)
    render(json: post)
    # Post.find_by(id: params[:id])
  end

  def create
    post = Post.new(post_params)
    if post.save
     render(json: post)
    else
      render(json: post.errors.details, status: :unprocessable_entity)
    end
  end

  def update
    id = params[:id]
    post = Post.find_by(id: id)
    p post_params
    if post.update(post_params)
      render(json: post)
    else
      render(json: post.errors.details, status: :unprocessable_entity)
    end
  end

  def destroy
    id = params[:id]
    post = Post.find_by(id: id)
    post.destroy
    render(json: post)
  end

   private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
