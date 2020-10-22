class GalleriesController < ApplicationController
    skip_before_action :authorized
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

    def update
        thisGal = Gallery.find_by(user: current_user)
        thisGal.update(name: params[:description])
        render json: current_user, status: :accepted
    end

    def floors
        results = Api.floors(params[:id])
        render json: results
    end

    def my_gallery
        my_gallery = Gallery.find_by(user: current_user)  
              
        render json: my_gallery
    end

    def specific_gallery
        found_gallery =Gallery.find_by(user_id: params[:user_id])
        render json: found_gallery
    end
    def user_galleries
        ham = User.find_by(username: "HAM")
        
        galleries = Gallery.where.not(user_id: ham.id).where.not(user_id: current_user.id)
        
        render json: galleries, status: :accepted
    end
end
