# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# FloorGallery.destroy_all
# Floor.destroy_all
# GalleryPainting.destroy_all
# Gallery.destroy_all
# User.destroy_all
# Painting.destroy_all


# U1 = User.create(username: "Bob", password: "123", portrait: "picasso")
# U2 = User.create(username: "Angela", password: "123", portrait: "frida")
# P1 = Painting.create(blurb: "It’s great", artist: "Van Gogh", museum_location: 124, period: "19th Century", image_location: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTY2NTIzMzc4MTI2MDM4MjM5/vincent_van_gogh_self_portrait_painting_musee_dorsay_via_wikimedia_commons_promojpg.jpg", style: "impressionism")
# P2 = Painting.create(blurb: "This blows", artist: "Shaun", museum_location: 130, period: "yesterday", image_location: "https://i.pinimg.com/originals/57/42/a9/5742a906259d5d479c05726a935a3e2e.jpg", style: "shred" )
# G1 = Gallery.create(user_id: U1.id, name: "Red Room")
# G2 = Gallery.create(user_id: U2.id, name: "Green Room")
# GP1 = GalleryPainting.create(gallery: G1, painting: P1)
# GP2 = GalleryPainting.create(gallery: G2, painting: P2)
ham = User.create(username: "HAM", password: "123", portrait: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Ham_%284%29.jpg/440px-Ham_%284%29.jpg")
rooms=[3620, 3600, 3500, 2500, 2540, 2520, 2700, 2130, 2120, 2100, 2220, 2300, 2340, 2400, 1440]

url = "https://api.harvardartmuseums.org/gallery?size=70&apikey=7df5a0dc-198d-40ec-8832-43c122f075fa"
uri = URI(url)
response = Net::HTTP.get_response(uri)
json_response = JSON.parse(response.read_body) 

json_response["records"].each do |record|
    if rooms.include?(record["id"])
        description = record["labeltext"]
        ham_id = record["id"]
        theme = record["theme"]
        name = record["name"]
        Gallery.create(user: ham, name: name, description: description, ham_id: ham_id, theme: theme, )
    end

end
puts "lala"