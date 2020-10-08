class CreateUserDiseases < ActiveRecord::Migration[6.0]
  def change
    create_table :user_diseases do |t|
      t.integer :user_id
      t.integer :disease_state_id

      t.timestamps
    end
  end
end
