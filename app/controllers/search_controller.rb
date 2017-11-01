class SearchController < ApplicationController
  def index
    query = params[:query]
    search = Post.ransack title_or_content_or_address_cont: query,
                               user_name_or_user_email_cont: query,
                               m: "or"
    @posts = search.result.page(params[:page]).per Settings.per_page
  end
end
