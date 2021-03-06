class Api::V1::AuthsController < ApplicationController
    skip_before_action :logged_in? , only: [:create]

    #login
    def create 
        # debugger
        user = User.find_by(username: params[:username])
    #    byebug
        if user && user.authenticate(params[:password])
          render json: {user: user, notes: user.notes, medications: user.medications, username: user.username, first_name: user.first_name, id: user.id, token: encode_token({user_id: user.id})}, status: :created
        else
            render json: {error: 'invalid username or password!'}
        end
    end

    


end
