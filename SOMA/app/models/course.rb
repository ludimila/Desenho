class Course < ActiveRecord::Base
  belongs_to :doctor
  has_many :students
  has_many :documents, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :workload, presence: true, numericality: true
  validates :name, :doctor_id, presence: true
end
