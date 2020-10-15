class PaintingsController < ApplicationController

    def show
        results = Api.gallery(params[:id])
        render json: results
    end

    def floors
        results = Api.floors(params[:id])
        render json: results
    end

    def search
        results = Api.keyword_search(params[:keyword])
        render json: results
    end
    
end
