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

  def click_like
    post = Post.find(params[:id])
    review_exists = Review.where(user_id: current_user.id).where(post: post).first
    if review_exists
      if review_exists.rating == 1
      review_exists.destroy
      # some stimulus stuff to toggle green
      elsif review_exists.rating == -1
      review_exists.update(rating: 1)
      # some stimulus stuff to toggle red
      end
    else
      @review = Review.new(rating: 1, user_id: current_user.id, post: post)
      @review.save
        # redirect_to redirect_to post_path(post), notice: "like :)"
      # some stimulus stuff to toggle green
    end
    redirect_to post_path(post), notice: "click_like done"
  end

  def click_dislike
    post = Post.find(params[:id])
    review_exists = Review.where(user_id: current_user.id).where(post: post).first
    if review_exists
      if review_exists.rating == -1
      review_exists.destroy
      elsif review_exists.rating == 1
      review_exists.update(rating: -1)
      # some stimulus stuff to toggle red
      end
    else
      @review = Review.new(rating: -1, user_id: current_user.id, post: post)
      @review.save
        # redirect_to redirect_to post_path(post), notice: "like :)"
      # some stimulus stuff to toggle green
    end
    redirect_to post_path(post), notice: "click_like done"
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
