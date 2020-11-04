class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @users = current_user
  end

  def index
    @books = Book.all
    @users = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end

end
