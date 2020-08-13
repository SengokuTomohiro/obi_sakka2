class CatchcopiesController < ApplicationController
    def index
        @catchcopies= Catchcopy.all
        @book = Book.find(params[:id])
        @catchcopies = @user.catchcopies.paginate(page: params[:page])
    end

    def new
        @catchcopy= Catchcopy.new
    end    
    
    def create
        @catchcopy= Catchcopy.new
        if @catchcopy.save
            redirect_to 'catchcopies/index'
          else
            redirect_to 'catchcopies/new'
          end
        
    end
    
    private
    def catchcopy_params
        params.require(:catchcopy).permit(:content, :book_id)
    end    
end
