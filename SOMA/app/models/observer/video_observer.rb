class VideoObserver < UpdateObserver
  def notify_creation(course, attribute)
    course << "Video #{course.video.name} adidicionado em #{attribute.created_at.format(:short)}"
  end
  
  def notify_edition(course, attribute)
    course << "Video #{course.video.name} editado em #{attribute.updated_at.format(:short)}"
  end
  
  def notify_destuction(course, attribute)
    course << "Video #{course.video.name} removido em #{attribute.updated_at.format(:short)}"
  end
end
