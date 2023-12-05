class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @books = @books.search(params[:query]) if params[:query].present?
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book added successfully.'
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book removed successfully.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :available)
  end

  def authorize_user
    redirect_to root_path, alert: 'You are not authorized to perform this action' unless current_user && current_user.regular_user?
  end
  
end
