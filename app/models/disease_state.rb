class DiseaseState < ApplicationRecord
    has_many :med_diseases
    has_many :medications, through: :med_diseases

    has_many :user_diseases
    has_many :users, through: :user_diseases
end
