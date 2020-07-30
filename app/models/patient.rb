class Patient < ActiveRecord::Base
    has_many :appointments
    has_many :therapists, through: :appointments
    has_secure_password



end


