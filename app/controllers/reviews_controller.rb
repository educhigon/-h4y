class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @post = Post.find(params[:post_id])
    @review.post = @post
    if @review.save
      redirect_to post_path(@post)
    else
      @favorite = Favorite.new
      render "posts/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to post_path(@review.post)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
end
