class DocumentObserver < UpdateObserver
  def self.notify_creation(course, attribute)
    course << "Documento #{attribute.document_file_name.to_s} adicionado em #{attribute.created_at.to_formatted_s(:short)}"
    course.save
  end
  
  def self.notify_destruction(course, attribute)
    course << "Documento #{attribute.document_file_name.to_s} removido em #{attribute.updated_at.to_formatted_s(:short)}"
    course.save
  end
end
