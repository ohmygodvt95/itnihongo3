class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :find_post, only: [:create, :destroy]

  def create
    @post.comments.new new_comment_params
    if @post.save
      flash[:success] = "コメントした"
    else
      flash[:error] = "コメントできません"
    end
    redirect_to post_path(@post, anchor: "comment")
  end

  def destroy
    comment = @post.comments.find_by id: params[:id]
    if comment.destroy
      flash[:success] = "コメントが削除されました"
    else
      flash[:error] = "コメントは削除できません"
    end
    redirect_to post_path(@post, anchor: "comments")
  end

  protected
  def find_post
    @post = Post.find_by id: params[:post_id]
    unless @post
      flash[:error] = "写真がありません"
      redirect_to root_path
    end
  end

  def new_comment_params
    params.require(:comment).permit :user_id, :body
  end
end
