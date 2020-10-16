class Api::V1::UserMedicationsController < ApplicationController
    skip_before_action :logged_in? , only: [:index, :create]

  def index
      @user_medications = UserMedication.all
      render json: @user_medications
  end
  
  def create
    #  byebug 
    user_medication = UserMedication.create(medication_id: params[:medication_id], user_id: params[:user_id])
    render json: user_medication
  end
  
  

  private 

#   def user_meds_params
#     params.require(:user_medication).permit(:user_id, :medication_id)
#   end
end
