class Api::V1::DiseaseStatesController < ApplicationController
    skip_before_action :logged_in? , only: [:index, :create]

    def index
        disease_states = DiseaseState.all
        render json: disease_states
    end
    

def create
    disease_state = DiseaseState.new(disease_state_params)
    if disease_state.valid?
        disease_state.save
        user = User.find(params[:disease_state][:user_id])
        user.disease_states << disease_state
      render json: {success: "Successful submission!!"}
      #after disease gets saved find user by params
      #shovel in saved disease into user.disease_states
    
    else
      render json: {error: "Failed to submit data", messages: ['Check submission information!']}
    end
end

def update
    disease_state = DiseaseState.find(params[:id])

    if disease_state.update(disease_state_params)
        render json: disease_state.to_json

    else 
        render json: disease_state.errors, status: :unprocessable_entity
    end
end

end

private

def disease_state_params
    params.require(:disease_state).permit(:hypertension, :hyperlipidemia, :copd, :diabetes)
end
