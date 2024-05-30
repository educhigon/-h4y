class SearchesController < ApplicationController
  def index
    if params[:query].present?
      @query = params[:query]
      @post_results = Post.search_by_title_and_content(@query)
      # @tag_results = Tag.search_by_name(@query)
      @profile_results = Profile.search_by_username_and_bio(@query)
    else
      @post_results = Post.none
      # @tag_results = Tag.none
      @profile_results = Profile.none
    end
  end
end
