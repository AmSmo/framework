class GalleriesController < ApplicationController
    def show
        results = Api.gallery(params[:id])
        
        prettified = results.map do |result|
    
            {images: result["images"][0]["baseimageurl"],
                division: result["division"],
                blurb: result["labeltext"],
                artist: result["people"][0]["name"],
                dated: result["dated"],
                medium: result["medium"]}
            
        end
        
        prettified.compact!
        # byebug
        # img = result[0]["images"][0]["baseimageurl"]
        # division = result[0]["division"]
        # blurb: result[0]["labeltext"]
        # artist: result[0]["people"][0]["name"]
        # dated: result[0]["dated"]
        # medium: result[0]["medium"]
        # id = results[0]["id"]
        #  if results["info"]["next"]
            # next_page = results["info"]["pages"].to_i + 1
    # end
        
        render json: prettified
    end

    def floors
        results = Api.floors(params[:id])
        # gallerynumber = result[0]["gallerynumber"]
        # decription = result[0]["labeltext"]
        # name = results["records"][0]["name"]
        
        render json: results
    end

end
