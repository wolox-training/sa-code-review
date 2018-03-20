class PostsController < ApplicationController
  def index
    if params[:user]
      if User.exists? params[:user]
        @posts = Post.where(user_id: params[:user]).order(created_at: :desc)
        render :index
      else
        redirect_to posts_url
      end
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params.merge(user: current_user))

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def like
    post = Post.find(params[:post_id])
    UpdateLikeCount.perform_async(post)
    Like.create(post: post, user: current_user)
    head :ok
  end

  def featured
    FindFeaturedPosts.perform_async
    @posts = Post.where(featured: true).order(created_at: :desc)
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
