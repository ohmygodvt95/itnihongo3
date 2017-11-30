class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :find_post, only: [:show, :create, :edit, :update, :destroy]

  def show
    @comments = @post.comments.page(params[:page]).per Settings.per_page
  end

  def new
    @post = current_user.posts.new
  end

  def create
    post = current_user.posts.new post_params
    if post.save
      flash[:success] = "新しい投稿を作成しました"
      redirect_to root_path
    else
      flash[:success] = "エラー"
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = "更新しました"
      redirect_to @post
    else
      flash[:danger] = "エラー"
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "削除された"
      redirect_to root_path
    else
      flash[:danger] = "エラー"
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
