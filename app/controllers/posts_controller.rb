class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def new
    @post = current_user.posts.new
  end

  def create
    post = current_user.posts.new post_params
    if post.save
      flash[:success] = "Create new post successfully"
      redirect_to root_path
    else
      flash[:success] = "Create new post error"
      redirect_to new_post_path
    end
  end

  private
  def post_params
    params.require(:post).permit :user_id, :title, :image, :content, :address
  end
end
