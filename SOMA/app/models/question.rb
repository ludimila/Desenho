class Question < ActiveRecord::Base
  belongs_to :course, inverse_of: :questions
end
