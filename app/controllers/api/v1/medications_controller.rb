class Api::V1::MedicationsController < ApplicationController

    def index
        medications = Medication.all
        render json: medications, except: [:updated_at, :created_at]
    end

    def show
        medication = Medication.find_by(id: params[:id])
        render json: medication
    end
    
    def destroy
        medication = Medication.find_by(id: params[:id])
        medication.destroy!
        render json: {}
    end
end
