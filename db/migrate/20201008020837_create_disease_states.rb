class CreateDiseaseStates < ActiveRecord::Migration[6.0]
  def change
    create_table :disease_states do |t|
      t.boolean :hypertension
      t.boolean :hyperlipidemia
      t.boolean :diabetes
      t.boolean :copd

      t.timestamps
    end
  end
end
