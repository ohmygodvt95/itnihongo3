class HomeController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per Settings.per_page
  end
end
