class GalleriesController < ApplicationController
    
    def show
        results = Api.gallery(params[:id])
        
        prettified = results.map do |result|
            
            {image: result["images"][0]["baseimageurl"],
            title: result["title"],
                division: result["division"],
                blurb: result["labeltext"],
                artist: result["people"][0]["name"],
                dated: result["dated"],
                style: result["medium"],
                ham_id: result["id"],
                museum_location: params[:id]
            }
            
        end
        
        prettified.compact!
        
    
        render json: prettified
    end

    def floors
        results = Api.floors(params[:id])
        render json: results
    end

    def my_gallery
        my_gallery = Gallery.find_by(user: current_user)        
        render json: my_gallery
    end
end
