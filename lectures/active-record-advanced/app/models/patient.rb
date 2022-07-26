class Patient < ActiveRecord::Base
  has_many :consultations
  has_many :doctors, through: :consultations
  # has_one :social_security_number
end