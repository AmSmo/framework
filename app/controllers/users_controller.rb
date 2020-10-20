class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login]

    def create
        @user = User.create(user_params)
        
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end
 
    def auth
      render json: { user: UserSerializer.new(@user) }, status: :accepted
    end

    def login
      @user= User.find_by(username: user_params[:username])
      if @user.authenticate(user_params[:password])
        token = encode_token({user_id: @user.id})
        render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end

    
    def add_favorites
      
      
      new_favorite = Painting.create(painting_params)
      # {"image"=>"https://nrs.harvard.edu/urn-3:HUAM:DDC231686_dynmc", 
      #"title"=>"A Shepherd", 
      #"division"=>"European and American Art", 
      #"blurb"=>"A resident of Utrecht, one of the cultural capitals of the Dutch Republic, Wtewael specialized in pictures of biblical and mythological subjects. Whether executed on large canvases or small copper supports, his ambitious compositions are densely packed with  incidental detail and attenuated figures in elegant, expressive poses. In these paired paintings, the shepherd and shepherdess fill most of the pictorial space. That they seem poised to emerge from their confinement enhances our intimate engagement with them. They project an arch se
      #nsuality through their coy smiles and bare shoulders, the bagpipe and crook, and the curve of a breast. Their costumes and attributes allude to the fashion in Dutch art and literature of the 1620s for amorous fantasies, with lovers imitating the randy shepherds of ancient and Renaissance pastoral poetry. The sophisticated amalgam of poetic allusion, mischievous sexuality, and pictorial illusionism is typical of Utrecht paintings of this period.",
      # "artist"=>"Joachim Wtewael", 
      #"dated"=>"1623", "medium"=>"Oil on panel", 
      #"ham_id"=>227237, "gallery_id"=>2300} permitted: false>, "comment"=>"What a creep!", "controller"=>"users", "action"=>"add_favorites", "user"=>{}} permitted: false>
      # (byebug) current_user
      #   CACHE User Load (0.0ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 16], ["LIMIT", 1]]
      #   ↳ app/controllers/application_controller.rb:26:in `current_user'
      # #<User id: 16, username: "Cat", password_digest: [FILTERED], portrait: nil, created_at: "2020-10-18 15:48:40", updated_at: "2020-10-18 15:48:40">
      # (byebug) painting_params[:artist]
      # Unpermitted parameters: :image, :title, :division, :dated, :medium, :ham_id, :gallery_id
      # "Joachim Wtewael"
      # rename gallery_id
      gallery = Gallery.find_or_create_by(user: current_user)
      comment = GalleryPainting.create(gallery: gallery, painting: new_favorite, comment: params[:comment])
      render json: comment, status: :accepted
    end

  private

  def user_params
    params.require(:user).permit(:username, :password, :portrait)
  end

  def painting_params
    params.require(:painting).permit(:blurb, :artist, :museum_location, :dated, :image, :style, :title, :division, :ham_id )
  end

  def fave_params
    params.require(:favorite).permit!
  end

end
