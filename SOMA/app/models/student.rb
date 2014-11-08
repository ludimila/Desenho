class Student < User
  has_and_belongs_to_many :courses, -> { uniq }
  
  def student?
    true
  end
end
