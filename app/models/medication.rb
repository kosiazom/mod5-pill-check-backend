class Medication < ApplicationRecord
    has_many :userMedications
    has_many :users, through: :userMedications

    has_many :med_diseases
    has_many :disease_states, through: :med_diseases

end
