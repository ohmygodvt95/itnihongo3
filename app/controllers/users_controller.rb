class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    @posts = @user.posts.order(id: :desc)
      .page(params[:page]).per Settings.per_page
  end
end
