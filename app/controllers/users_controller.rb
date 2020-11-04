class UsersController < ApplicationController
  before_action :authenticate_user!

  def top
  end

  def about
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @users = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  private
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
