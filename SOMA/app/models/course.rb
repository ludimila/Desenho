class Course < ActiveRecord::Base
  belongs_to :doctor, inverse_of: :courses

  has_and_belongs_to_many :students

  has_many :documents, dependent: :destroy, inverse_of: :course, autosave: true
  has_many :videos, dependent: :destroy, inverse_of: :course, autosave: true
  has_many :questions, dependent: :destroy, inverse_of: :course, autosave: true

  validates :workload, presence: true, numericality: true
  validates :name, :doctor_id, presence: true
end
