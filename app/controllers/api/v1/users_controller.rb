class Api::V1::UsersController < ApplicationController
 skip_before_action :logged_in?, only:[:create]

 def index
     users = User.all
     render json: users, except: [:updated_at, :created_at], include:[:notes, :user_medications, :user_diseases]
 end
 

#register to the app
def create

    @user = User.create(user_params)

    if @user.valid?
        render json: @user, only:[:username, :name, :email, :password], status: :created
    else
        render json: { error: 'failed to create user' }, status: :not_acceptable
    end
end

private
def user_params
    params.require(:user).permit(:name, :username, :password, :email)
end


end
