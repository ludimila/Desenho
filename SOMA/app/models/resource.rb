class Resource < ActiveRecord::Base
  belongs_to :course, inverse_of: :resources

  def self.per_page
    10
  end

  def document?
    false
  end

  def video?
    false
  end

  def question?
    false
  end
end
