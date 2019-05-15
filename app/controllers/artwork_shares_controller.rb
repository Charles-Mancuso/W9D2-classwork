class ArtworkSharesController < ApplicationController

    def index
        artworkshares = ArtworkShare.all
        render json: artworkshares
    end

    def create
        artworkshares = ArtworkShare.new(artwork_shares_params)

        if artworkshares.save
            render json: artworkshares
        else
            render json: artworkshares.errors.full_messages, status: 422
        end
    end

    def destroy
        artworkshare = ArtworkShare.find(params[:id])
        artworkshare.destroy
        render json: artworkshare
    end




    private
    def artwork_shares_params
        params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
    end
end