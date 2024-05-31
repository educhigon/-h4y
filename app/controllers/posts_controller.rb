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
      create_new_tags(@post)
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new, notice: "no bueno"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, tag_ids: [])
  end

  def create_new_tags(taggable)
    if params[:post][:new_tags].present?
      params[:post][:new_tags].split(',').each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name.strip)
        taggable.tags << tag unless taggable.tags.include?(tag)
      end
    end
  end
end
