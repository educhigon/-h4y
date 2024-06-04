class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.taggable_posts
  end

end
