class Course < ActiveRecord::Base
  serialize :last_updates, Array

  belongs_to :doctor, inverse_of: :courses

  has_and_belongs_to_many :students, -> { uniq }

  has_many :resources, dependent: :destroy, inverse_of: :course, autosave: true

  validates :workload, presence: true, numericality: true
  validates :name, presence: true, uniqueness: true
  validates :doctor_id, presence: true

  def << (update)
    if(self.last_updates.size == 30)
      self.last_updates.shift
    end
    self.last_updates << update
  end
end
