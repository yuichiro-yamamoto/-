class BooksController < ApplicationController
  def index
  	 @book = Book.new
  	 @books = Book.all
  end

  def show 
     @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end
  
  def create
  	  book = Book.new(book_params)
      if book.save
        flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      redirect_to book_path(book.id)
    end
  end

  def update
        book = Book.find(params[:id])
        
        if book.update(book_params)
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(book.id)
    else
        redirect_to book_path(book.id)
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


