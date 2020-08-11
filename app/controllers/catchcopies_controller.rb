class CatchcopiesController < ApplicationController
    def index
        @catchcopies= Catchcopy.all
    end

    def new
        @catchcopies= Catchcopy.new
    end    
    
    def create
        @catchcopies= Catchcopy.new
        
            redirect_to '/'
    end
    
end
