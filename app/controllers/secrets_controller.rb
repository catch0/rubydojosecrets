class SecretsController < ApplicationController
    #before_action :user_authorized, only: [:success]
    before_action :user_authorized, only: [:index, :create]
    before_action :user_logged_in, only: [:new]
    def index
        user = current_user
        @secrets = Secret.all.includes(:likes, :user)
        @secrets_liked_ids = user.secrets_liked_ids
    end
    
    def create
        secret=Secret.create(secret_params.merge(user: current_user))
        if secret.valid?
            redirect_to '/secrets'
        else
            flash[:secret_errors] = secret.errors.full_messages
            redirect_to '/users/#{session[:user_id]}'
        end
    end
    
    def destroy
        Secret.destroy(params[:id])
        redirect_to '/secrets'
    end
    
    private
        def secret_params
            params.require(:secret).permit(:content)
        end
    
    
end
