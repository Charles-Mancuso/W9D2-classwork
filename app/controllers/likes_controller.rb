class LikesController < ApplicationController
    def create
        like = Like.new(like_params)
        
        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: 422
        end
    end

    def destroy
        like = Like.find(params[:id])
        like.destroy
        render json: like
    end

    private
    def like_params
        params.require(:likes).permit(:gusto_id, :gusto_type)
    end
end