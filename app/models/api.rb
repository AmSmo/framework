class Api < ApplicationRecord

    def self.api_call(url)
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
        json_response = JSON.parse(response.read_body)    
    end

    def self.gallery(gallery_number)
        url = "https://api.harvardartmuseums.org/object?gallery=#{gallery_number}&apikey=#{ENV['HAM_KEY']}"
        Api.api_call(url)
    end

    def self.floors(floor_number)
        url = "https://api.harvardartmuseums.org/gallery?floor=#{floor_number}&size=30&apikey=#{ENV['HAM_KEY']}"
        Api.api_call(url)
    end

    def self.keyword_search(keyword)    
        url = "https://api.harvardartmuseums.org/object?keyword=#{keyword}&size=10&apikey=#{ENV['HAM_KEY']}"
        Api.api_call(url)
    end
    
end
