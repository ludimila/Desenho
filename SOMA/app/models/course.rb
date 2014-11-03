class Course < ActiveRecord::Base
  belongs_to :doctor
  has_many :students

  validates :workload, presence: true, numericality: true
  validates :name, :doctor_id, presence: true
end
