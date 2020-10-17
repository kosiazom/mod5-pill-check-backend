class Api::V1::UserMedicationsController < ApplicationController
    skip_before_action :logged_in? , only: [:index, :create, :show]

  def index
      @user_medications = UserMedication.all
      render json: @user_medications
  end

  def show
    
    user_medication = UserMedication.find(params[:id])
      render json: user_medication, except: [:updated_at, :created_at]
  end
  
  def create
    #  byebug 
    user_medication = UserMedication.create(medication_id: params[:medication_id], user_id: params[:user_id])
    # user = User.find_by(user_id: params[:user_id])
    medication = Medication.find_by(id: params[:medication_id])
    # user_medication = UserMedication.new(name: params[:name], drug_class: params[:drug_class], side_effects: params[:side_effects], image: params[:image], indication: [:indication], user_id: params[:user_id])
    # byebug
    render json: user_medication.medication
  end
  
  

  private 

#   def user_meds_params
#     params.require(:user_medication).permit(:user_id, :medication_id)
#   end
end
