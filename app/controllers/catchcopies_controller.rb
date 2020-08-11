class CatchcopiesController < ApplicationController
    def index
        @catchcopies= Catchcopy.all
    end

    def new
        @catchcopies= Catchcopy.new
    end    
    
    def create
        # ここにcatchcopy作成の記述
        redirect_to '/'
    end
    
end
