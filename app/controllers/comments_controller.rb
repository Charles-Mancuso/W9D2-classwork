class CommentsController < ApplicationController
    def index
        if params[:comments].has_key?(:user_id)
            all_comments = User.find(params[:comments][:user_id]).comments
        elsif params[:comments].has_key?(:artwork_id)
            all_comments = Artwork.find(params[:comments][:artwork_id]).comments
        else
            all_comments = Comment.all
        end

        render json: all_comments
    end

    def create
        comment = Comment.new(comment_params)
        
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end

    private
    def comment_params
        params.require(:comments).permit(:body, :user_id, :artwork_id)
    end
end