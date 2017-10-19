class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :find_post, only: [:show, :create, :edit, :update, :destroy]

  def show
  end

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

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = "Updated"
      redirect_to @post
    else
      flash[:danger] = "Error"
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Deleted"
      redirect_to root_path
    else
      flash[:danger] = "Error"
      redirect_to @post
    end
  end

  private
  def post_params
    params.require(:post).permit :user_id, :title, :image, :content, :address
  end

  def find_post
    @post = Post.find_by id: params[:id]
  end
end
