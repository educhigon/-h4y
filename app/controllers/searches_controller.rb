class SearchesController < ApplicationController
  def index
    @query = params[:query]

    if @query.present?
      case params[:type]
      when 'tags'
        @tag_results = Tag.search_by_name(@query)
        @profile_results = []
        @post_results = []
      when 'profiles'
        @profile_results = Profile.search_by_name_and_bio(@query)
        @tag_results = []
        @post_results = []
      else
        @post_results = Post.search_by_title_and_content(@query)
        @tag_results = []
        @profile_results = []
      end
    else
      @tag_results = []
      @profile_results = []
      @post_results = []
    end
  end
end
