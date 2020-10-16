class Api::V1::UsersController < ApplicationController
 skip_before_action :logged_in?, only:[:create, :show, :index]

 def index
     users = User.all
     render json: users, except: [:updated_at, :created_at], include:[:notes, :medications, :user_diseases]
 end
 

 def show
    user = User.find(params[:id])
    render json: user, except: [:updated_at, :created_at], include:[:notes, :medications, :user_diseases]
end
 

#register to the app
def create

    user = User.create(user_params)

    if user.valid?
        render json: {user: user, id: user.id, username: user.username, token: encode_token({user_id: user.id})}, status: :created
    else
        render json: { error: 'Failed to create user' }, status: :not_acceptable
    end
end

private
def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
end


end
