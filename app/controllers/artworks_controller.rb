class ArtworksController < ApplicationController

    def index
        if params.has_key?(:user_id)
            user_artwork = Artwork.where(artist_id: params[:user_id])
            user_artwork += User.find(params[:user_id]).shared_artworks
        else
            user_artwork = Artwork.all
        end

        render json: user_artwork
    end

    def create
        artwork = Artwork.new(artwork_params)
        
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    def favorite
        a = Artwork.find(params[:id])
        u = User.find(params[:user_id])
        if params[:user_id] == a.artist_id #params[:id]
            a.owner_fav = params[:owner_fav]
            a.save
        elsif u.shared_artworks.any? { |artwork| artwork.id == params[:id] } #first.id == params[:id]
            a.shared_fav = params[:shared_fav]
            a.save
        end
        render json: a
    end

    private
    def artwork_params
        params.require(:artworks).permit(:image_url, :title, :artist_id)
    end
end

#Bonus 2: Favorites
    #add boolean columns to artwork (owner_fav, shared_fav)              #
    #hit path of approximately user/user_id/artwork/id with get or patch         #
    #give params owner_fav: true/false or shared_fav: true/false                #
    #use (semantic custom route) favorite in artworkscontroller             #
    #if user_id = artist_id then update owner_fav table                     #
    #elsif User.shared_art includes artwork id, then update shared_fav      