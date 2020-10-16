class PaintingsController < ApplicationController

    def show
        results = Api.artwork(params[:id])
    end

    def search
        results = Api.keyword_search(params[:keyword])
        byebug
        render json: results
    end
    
end
