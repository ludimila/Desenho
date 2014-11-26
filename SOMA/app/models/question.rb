class Question < ActiveRecord::Base
  belongs_to :course, inverse_of: :questions
  has_many :question_options

  validates :right_answer, presence: true, numericality: { only_integer: true }
  validates :command, presence: true

  accepts_nested_attributes_for :question_options

  def right_answer?(answer)
    self.right_answer == answer
  end
end
