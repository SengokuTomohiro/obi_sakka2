class CatchcopiesController < ApplicationController
    def index
        @catchcopies = Catchcopy.all
    end    

    def new 
        @book = Book.find_by(google_id: params[:book_id])
        @catchcopy = Catchcopy.new
    end 
    
    def create
        @catchcopy = Catchcopy.new(catchcopy_parameter)
        if @catchcopy.save
            redirect_to '/catchcopies'
        else
            redirect_to '/catchcopies/new'
        end
    end
    
    private
    def catchcopy_parameter
        params.require(:catchcopy).permit(:content, :book_id)
    end

end    