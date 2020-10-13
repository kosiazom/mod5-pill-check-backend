class Api::V1::DiseaseStatesController < ApplicationController

def create
    disease_state = DiseaseState.new(params[:disease_state])

    if disease_state.valid?
        disease_state.save
      render json: {success: "Successful submission!!"}
    
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
    params.require(:disease_state).permit(:user_id, :hypertension, :hyperlidemia, :copd, :diabetes)
end
