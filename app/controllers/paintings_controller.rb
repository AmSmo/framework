class PaintingsController < ApplicationController

    def show
        # results = Api.(params[:id])
    end

    def search
        results = Api.keyword_search(params[:keyword])
        if results.length > 0
            prettified = results.map do |result|
                {image: result["images"][0]["baseimageurl"],
                    division: result["division"],
                    blurb: result["labeltext"],
                    artist: result["people"][0]["name"],
                    dated: result["dated"],
                    medium: result["medium"]}
                
            end
            prettified.compact!
            
            render json: prettified, status: :accepted
        else
            
            render json: {errors: ['no results']}, status: :accepted
        end
    end
    
end
