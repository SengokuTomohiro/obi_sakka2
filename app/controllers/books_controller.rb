class BooksController < ApplicationController
    def search
        @book= Book.new
    end 
    
    def create   
        @book = Book.new(book_params)
        @book.save
        redirect_to 'catchcopies/new'
    end  

    def show
        
    end

    private
    def book_params
        params.permit(:google_id, :title, :description, :image_url)
    end                        
end
