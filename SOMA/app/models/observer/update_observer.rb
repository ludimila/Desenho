class UpdateObserver < ActiveRecord::Base
  def self.notify_creation(course, attribute)
  end
  
  def self.notify_edition(course, attribute)
  end
  
  def self.notify_destuction(course, attribute)
  end
end
