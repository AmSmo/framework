class PaintingsController < ApplicationController
    skip_before_action :authorized
   
     def show
        single_painting = Api.painting(params[:id])
        
        return_comment = ""
        comment = current_user.gallery_paintings.find{|gp| gp.painting.ham_id === single_painting["objectid"]}
        if comment
            return_comment = comment.comment
        end
        
        user = UserSerializer.new(current_user)
        result = {image: single_painting["images"][0]["baseimageurl"],
            title: single_painting["title"],
                division: single_painting["division"],
                blurb: single_painting["labeltext"],
                artist: single_painting["people"][0]["name"],
                dated: single_painting["dated"],
                style: single_painting["medium"],
                    ham_id: single_painting["objectid"],
                    comment: return_comment,
                    user: user
                    
                }
                if  single_painting["gallery"]
                    result[:museum_location] = single_painting["gallery"]["galleryid"]
                end
        render json: result, status: :accepted
    end

    def search
        results = Api.keyword_search(params[:keyword])
        
        if results.length > 0
            prettified = results.map do |result|
              
                object = {
                    division: result["division"],
                    blurb: result["labeltext"],
                    dated: result["dated"],
                    style: result["medium"],
                    ham_id: result["id"],
                    
                }
                if result["images"] 
                    object[:image] = result["images"][0]["baseimageurl"]
                end
                if result["people"] 
                    object[:artist] =result["people"][0]["name"]
                end
                object
            end
            prettified.compact!
            
            render json: prettified, status: :accepted
        else
            
            render json: {errors: ['no results']}, status: :accepted
        end
    end

   
    
end
