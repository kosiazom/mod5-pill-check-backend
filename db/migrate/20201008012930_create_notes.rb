class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :description
      t.string :date
      t.integer :user_id
      t.timestamps
    end
  end
end
