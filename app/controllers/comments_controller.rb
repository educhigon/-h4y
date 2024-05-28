class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user: current_user, post: @post, content: comment_params )
    if @comment.save
      redirect_to @post, notice: "Comment created"
    else
      redirect_to @post, notice: "Comment failed"
    end
  end

  def delete
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to root
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
