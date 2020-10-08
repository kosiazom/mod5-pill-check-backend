class CreateUserMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_medications do |t|
      t.integer :user_id
      t.integer :medication_id

      t.timestamps
    end
  end
end
