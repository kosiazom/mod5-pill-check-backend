require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
Medication.destroy_all
# DiseaseState.destroy_all
# UserMedication.destroy_all
# Note.destroy_all

med_csv = CSV.foreach(Rails.root.join("medication-list.csv"), headers: true) do |row|
        Medication.create( {
            name: row["Name"],
            drug_class: row["Drug_class"],
            side_effects: row["SideEffects"],
            indication: row["Indication"],
            image: row["Image"]
        })
    end
puts "med created"

# kosi = User.create(first_name: "KoKo", last_name: "Chanel", username:"koko", password: "password", email: "koko@gmail.com")
# puts "user created"

# hctz = Medication.create(name: "HCTZ", drug_class: "diuretics", side_effects: "dizziness", indication: "blood pressure", image: "data:image/jpeg;base64,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" )
# mfm = Medication.create(name: "Metformin", drug_class: "biguanide", side_effects: "drowsiness", indication: "diabetes", image: "data:image/jpeg;base64,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")



# dzs = DiseaseState.create(hypertension: false, hyperlipidemia: false, diabetes: false)
# puts "disease created"

# mynote1 = Note.create(date: "10/08/2020", description: "This is my first note about my medication", user_id: kosi.id)
# mynote2 = Note.create( date: "10/08/2020", description: "This is my second note about my medicine", user_id: kosi.id)
# puts "notes created"

# myownmed1 = UserMedication.create(user_id: kosi.id , medication_id: med_csv.id)

# mydiseasestate = UserDisease.create(user_id: kosi.id, disease_state_id: dzs.id)


puts "seed successful!"
