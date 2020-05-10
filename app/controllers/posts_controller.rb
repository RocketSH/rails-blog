class PostsController < ApplicationController
  before_action :find_post, only:[:edit, :update, :show, :destroy]

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to posts_path, notice: "Sorry, we can not find this post."  
  end

  def index
    @posts = Post.order(created_at: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "The post has been created."
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      redirect_to @post, data: { confirm: "Ready to update this post?"}, notice: "This post has been update."

    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post.destroy if @post
    redirect_to root_path, notice: "This post has been delete."
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
    
  end
end
