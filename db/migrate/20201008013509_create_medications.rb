class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :drug_class
      t.string :side_effects
      t.string :indication
      t.string :image

      t.timestamps
    end
  end
end
