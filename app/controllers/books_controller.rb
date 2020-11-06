class BooksController < ApplicationController
  def show
    @books = Book.find(params[:id])
    @user = User.find(params[:id])
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
    if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(@book)
    else
      render :show
    end
  end

  def destroy
  end

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end

end
