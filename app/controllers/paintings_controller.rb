class PaintingsController < ApplicationController
    skip_before_action :authorized
   
     def show
        single_painting = Api.painting(params[:id])
        
        result = {image: single_painting["images"][0]["baseimageurl"],
            title: single_painting["title"],
                division: single_painting["division"],
                blurb: single_painting["labeltext"],
                artist: single_painting["people"][0]["name"],
                dated: single_painting["dated"],
                style: single_painting["medium"],
                    ham_id: single_painting["objectid"],
                    museum_location: single_painting["gallery"]["galleryid"]
            }
            
        render json: result, status: :accepted
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
                    style: result["medium"],
                    ham_id: result["id"],
                    museum_location: result["gallery"]["galleryid"]
                }
                
            end
            prettified.compact!
            
            render json: prettified, status: :accepted
        else
            
            render json: {errors: ['no results']}, status: :accepted
        end
    end

   
    
end
