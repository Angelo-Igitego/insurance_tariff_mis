class Api::V1::SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            session[:role] = user.role
            render json: {status: 201, user: user}
        else
            render json: {status: 401, message: "Unauthorized"}
        end
    end
end