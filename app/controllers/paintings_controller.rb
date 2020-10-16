class PaintingsController < ApplicationController

    def show
        # results = Api.(params[:id])
    end

    def search
        results = Api.keyword_search(params[:keyword])
        render json: results
    end
    
end
