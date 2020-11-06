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
  end

  def edit
    @user = User.find(current_user.id)
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
       render :edit
    end
  end

  private
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
