class CreateDiseaseStates < ActiveRecord::Migration[6.0]
  def change
    create_table :disease_states do |t|
      t.boolean :hypertension, :default => false
      #Ex:- :default =>''
      t.boolean :hyperlipidemia, :default => false
      #Ex:- :default =>''
      t.boolean :diabetes, :default => false
      t.boolean :copd, :default => false

      t.timestamps
    end
  end
end
