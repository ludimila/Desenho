class Doctor < User
  has_many :courses, inverse_of: :doctor
end
