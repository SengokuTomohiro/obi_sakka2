class BooksController < ApplicationController
    def create   
        @book= Book.find_or_create_by(book_params)
    end  
    
    def search
    end 
    

    def show
        @book = Book.find(params[:id])
        @catchcopies = @book.catchcopies
    end

    private
    def book_params
        params.permit(:google_id, :title, :description, :image_url)
    end                        
end
