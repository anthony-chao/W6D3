class UsersController < ApplicationController
    def index
        render plain: "I'm in the index action!"
    end

    def create
        user = User.new(user_params)
  # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        
        user = User.find(params[:id])
    end  

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to user_url  
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end


end