class UsersController < ApplicationController
  before_action :find_user, only: :show

  def show
    @posts = @user.posts.order(id: :desc)
      .page(params[:page]).per Settings.per_page
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = "User not found!"
      redirect_to root_path
    end
  end
end
