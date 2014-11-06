class Video < ActiveRecord::Base
  belongs_to :course, inverse_of: :videos
end
