class Api::V1::UserDiseasesController < ApplicationController
    skip_before_action :logged_in? , only: [:index, :create]

    def index
        @user_disease = UserDisease.all
        render json: @user_diseases
    end
    
    def create
    #    byebug 
      user_disease = UserDisease.create(disease_state_id: params[:disease_state_id], user_id: params[:user_id])
      render json: user_disease
    
    

end
