class CatchcopiesController < ApplicationController
    before_action :set_book_id

    def new
        @catchcopy= Catchcopy.new  
    end    
    
    def create
        @catchcopy = Catchcopy.new(
            content: params[:content],
            book_id: @book_id
          )
        if @catchcopy.save
          render 'index'
        else
          render 'new'
        end
    end

    def index
        @catchcopies= Catchcopy.all
    end

    private
    def catchcopy_params
        params.require(:catchcopy).permit(:content,:book_id)
    end     
    
    def set_book_id
        @book_id = Book.find_by(id: params[:id])
    end
end
