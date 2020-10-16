class Api::V1::MedicationsController < ApplicationController
    skip_before_action :logged_in? , only: [:index, :create, :show]
    
    def index
        medications = Medication.all
        render json: medications, except: [:updated_at, :created_at]
    end

    def show
        medication = Medication.find_by(id: params[:id])
        render json: medication
    end

    def create
        medication = Medication.new(medication_params)
        if medication.valid?
            # byebug
            medication.save
            user = User.find_by(params[:medication][:user_id])
            user.medications << medication
          render json: {success: "Successful submission!!"}
          #after medication gets saved find user by params
          #shovel in saved disease into user.medications
        
        else
          render json: {error: "Failed to submit data", messages: ['Check submission information!']}
        end
    end
    
    def destroy
        medication = Medication.find_by(id: params[:id])
        medication.destroy!
        render json: {}
    end

    private

    def medication_params
        params.require(:medication).permit(:name, :drug_class, :side_effects, :image, :indication)
    end

end
