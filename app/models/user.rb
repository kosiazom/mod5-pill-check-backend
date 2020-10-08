class User < ApplicationRecord
    has_secure_password
    has_many :user_medications
    has_many :medications, through: :user_medications

    has_many :user_diseases 
    has_many :disease_states, through: :user_diseases

    has_many :notes

    validates :username, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false}
end
