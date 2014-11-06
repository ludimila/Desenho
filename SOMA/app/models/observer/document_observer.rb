class DocumentObserver < UpdateObserver
  def notify_creation(course, attribute)
    course << "Documento #{course.video.name} adidicionado em #{attribute.created_at.format(:short)}"
  end
  
  def notify_edition(course, attribute)
    course << "Documento #{course.video.name} editado em #{attribute.updated_at.format(:short)}"
  end
  
  def notify_destuction(course, attribute)
    course << "Documento #{course.video.name} removido em #{attribute.updated_at.format(:short)}"
  end
end
