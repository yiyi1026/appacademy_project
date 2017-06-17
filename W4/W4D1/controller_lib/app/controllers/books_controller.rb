class BooksController < ApplicationController
  def index
    @books = Book.all

  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  # attr_reader :book
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
