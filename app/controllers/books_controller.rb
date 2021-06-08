class BooksController < ApplicationController
  
  def create
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      render :index
    end
  end
  
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
    @book_detail_comment = BookComment.new
    @user = User.find(@book_detail.user_id)
  end
  
  def edit
    if Book.find(params[:id]).user_id == current_user.id
      @book = Book.find(params[:id])
    else
      redirect_to books_path
    end
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
