class Intern < ActiveRecord::Base
  belongs_to :doctor
  # def doctor
  #   Doctor.find(doctor_id)
  # end
end