class BooksController < ApplicationController

    def root
    end

    def index
        @books = Book.all
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:success1] = "Book was successfully created!"
            redirect_to book_path(@book.id)
        else
            @books = Book.all
            render("books/index")
        end
    end
    
    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:success2] = "Book was successfully uploaded!"
            redirect_to book_path(@book.id)
        else
            render("books/edit")
        end
    end

    def destroy
        book = Book.find(params[:id])
        if book.destroy
            flash[:success3] = "Book was successfully destroyed!"
            redirect_to books_url
        else
            render("books/index")
        end
    end

    private
    
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
