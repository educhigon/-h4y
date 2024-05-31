class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def my_posts
    @posts = Post.where(user_id: current_user)
  end

  def my_favorites
    @posts = []
    favorite = Favorite.where(user_id: current_user)
    favorite.each do |fav|
      @posts << fav.post
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user


    if @post.save
      redirect_to post_path(@post), notice: "post created"
    else
      render :new, notice: "no bueno"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photos => [])
  end
end
