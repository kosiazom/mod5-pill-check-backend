class CreateMedDiseases < ActiveRecord::Migration[6.0]
  def change
    create_table :med_diseases do |t|
      t.integer :medication_id
      t.integer :disease_state_id

      t.timestamps
    end
  end
end
