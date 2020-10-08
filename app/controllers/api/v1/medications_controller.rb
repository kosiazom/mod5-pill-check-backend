class Api::V1::MedicationsController < ApplicationController

    def index
        medications = Medication.all
        render json: medications, except: [:updated_at, :created_at]
    end

    def show
        
        
    end
    
end
