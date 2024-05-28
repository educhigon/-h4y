class FavoritesController < ApplicationController
  before_action :set_favorite, only: :destroy
  before_action :set_post, only: [:new, :create]

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.post = @post
    if @favorite.save
      redirect_to post_path(@post)
    else
      @review = Review.new
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite.destroy
    redirect_to post_path(@favorite.post), status: :see_other
  end

  private

  def favorite_params
    params.require(:favorite).permit(:comment, :user_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
