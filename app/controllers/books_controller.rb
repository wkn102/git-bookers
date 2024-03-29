class BooksController < ApplicationController

  def index
     @books = Book.all
     @books = Book.all
     @book = Book.new
  end

  def show
     @book = Book.find(params[:id])
  end

  def create
     @book = Book.new(book_params)
   if @book.save
    redirect_to book_path(@book), notice: 'successfully'
   else
     @books = Book.all
     render :index
   end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @books =Book.all
   if @book.update(book_params)
    redirect_to book_path(@book), notice: 'successfully'
   else
    render:edit
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
