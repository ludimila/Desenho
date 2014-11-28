class QuestionObserver < UpdateObserver
  def self.notify_creation(course, attribute)
    course << "Questão #{attribute.description} adidicionada em #{attribute.created_at.to_formatted_s(:short)}"
    course.save
  end
  
  def self.notify_edition(course, attribute)
    course << "Questão #{attribute.description} editada em #{attribute.updated_at.to_formatted_s(:short)}"
    course.save
  end
  
  def self.notify_destruction(course, attribute)
    course << "Questão #{attribute.description} removida em #{attribute.updated_at.to_formatted_s(:short)}"
    course.save
  end
end

