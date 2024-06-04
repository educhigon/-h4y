require 'httparty'

class PostsController < ApplicationController
  def index
    @posts = []
    unless current_user.tags.empty?
      @posts = Post
      .joins(:tags)
      .select("posts.*, COUNT(tag_id) AS shared_tags")
      .where(tags: {id: current_user.tags.pluck(:id)})
      .group("posts.id")
      .order("shared_tags DESC")
    end
    @posts += Post.all
  end

  def index_recommended
    @posts = Post.all
    render json: @posts
  end

  def my_posts
    @posts = Post.where(user_id: current_user)
  end

  def friend_posts
    @posts = Post.where(user_id: params[:id])
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
    params.require(:post).permit(:title, :content, tag_ids: [], photos: [])
  end

  def create_new_tags(taggable)
    if params[:post][:new_tags].present?
      params[:post][:new_tags].split(',').each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name.strip)
        taggable.tags << tag unless taggable.tags.include?(tag)
      end
    end
  end

  def tag_search_params
    params.require(:tag).permit(:id)
  end
end
