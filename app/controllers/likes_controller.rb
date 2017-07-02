class LikesController < ApplicationController
    before_action :user_authorized, only: [:create]
    
    def create
       like = Like.create(user: current_user, secret:Secret.find(params[:id])) 
        redirect_to '/secrets'
    end
    
    def destroy
        Like.find_by(user: current_user, secret: Secret.find(params[:id])).destroy
        redirect_to '/secrets'
    end
end
