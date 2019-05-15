class UsersController < ApplicationController

    def index
        # params = { find_user: 'Beth', controller: :users, action: :index}  : [find_user, controller, action]
        if params.has_key?(:find_user)
            users = User.where(username: params[:find_user])
        else
            users = User.all
        end

        render json: users
    end

    def create
        user = User.new(user_params)
        
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end