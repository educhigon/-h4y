class FavoritesController < ApplicationController
  before_action :set_post, only: [:new, :create]
  before_action :set_post_delete, only: [:destroy]
  before_action :set_favorite, only: :destroy

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id)
    @favorite.post = @post
    if @favorite.save
      redirect_to my_favorites_path(@post)
    else
      @review = Review.new
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite.destroy
    # redirect_to post_path(@favorite.post), status: :see_other
    redirect_back(fallback_location: root_path)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:comment, :user_id)
  end

  def set_favorite
    @favorite = Favorite.where(post_id: @post.id, user_id: current_user.id).first
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_delete
    @post = Post.find(params[:id])
  end
end
