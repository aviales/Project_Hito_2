class HomesController < ApplicationController
    def index

        @q = params[:query]
    
        if @q
          @tweets = Tweet.where("content ~* ?", @q).page(params[:page])
        else
          @tweets = Tweet.page(params[:page])
        end

        @homes = Tweet.page(params[:page])
    
        current_user
        # @tweets = Tweet.page(params[:page])
        # @tweet = Tweet.new
        
    end
end
