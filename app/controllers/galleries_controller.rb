class GalleriesController < ApplicationController
    def show
        results = Api.gallery(params[:id])
        # img = results["records"][0]["images"][0]["baseimageurl"]
        # division = results["records"][0]["division"]
        # blurb = results["records"][0]["labeltext"]
        # artist = results["records"][0]["people"][0]["name"]
        # dated = results["records"][0]["dated"]
        # medium = results["records"][0]["medium"]
        # id = results[0]["id"]
        #  if results["info"]["next"]
            # next_page = results["info"]["pages"].to_i + 1
    # end
        byebug
        render json: results
    end

    def floors
        results = Api.floors(params[:id])
        # gallerynumber = results["records"][0]["gallerynumber"]
        # decription = results["records"][0]["labeltext"]
        # name = results["records"][0]["name"]
        byebug
        render json: results
    end

end
