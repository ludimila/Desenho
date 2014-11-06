class Document < ActiveRecord::Base
  belongs_to :course, inverse_of: :documents
end
