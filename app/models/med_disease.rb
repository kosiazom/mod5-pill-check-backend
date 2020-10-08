class MedDisease < ApplicationRecord
    belongs_to :medication
    belongs_to :disease_state
end
