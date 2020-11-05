class BooksController < ApplicationController
  def show
    @books = Book.find(params[:id])
    @book = Book.new
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(@book)
  end

  def destroy
  end

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end

end
