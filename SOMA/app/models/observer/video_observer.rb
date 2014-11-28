class VideoObserver < UpdateObserver
  def self.notify_creation(course, attribute)
    course << "Video #{attribute.description} adidicionado em #{attribute.created_at.to_formatted_s(:short)}"
    course.save
  end
  
  def self.notify_edition(course, attribute)
    course << "Video #{attribute.description} editado em #{attribute.updated_at.to_formatted_s(:short)}"
    course.save
  end
  
  def self.notify_destruction(course, attribute)
    course << "Vídeo #{attribute.description} removido em #{attribute.updated_at.to_formatted_s(:short)}"
    course.save
  end
end
