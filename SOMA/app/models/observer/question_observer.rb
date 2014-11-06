class QuestionObserver < UpdateObserver
  def notify_creation(course, attribute)
    course << "Questão #{course.question.name} adidicionada em #{attributecreated_at.format(:short)}"
  end
  
  def notify_edition(course, attribute)
    course << "Questão #{course.question.name} editada em #{attribute.updated_at.format(:short)}"
  end
  
  def notify_destuction(course, attribute)
    course << "Questão #{course.question.name} removida em #{atrribute.updated_at.format(:short)}"
  end
end
