class Doctor < ActiveRecord::Base
  has_many :interns
  # def interns
  #   Intern.where(doctor_id: id)
  # end
  has_many :consultations
  has_many :patients, through: :consultations

  validates :last_name, presence: true, length: { minimum: 3 }
end