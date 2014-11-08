class StudentObserver < UpdateObserver
  def self.notify_creation(course, attribute)
    course << "Novo aluno: #{attribute.name} matriculado #{Date.current}"
    course.save
  end

  def self.notify_destruction(course, attribute)
    course << "Aluno: #{attribute.name} removido em #{Date.current}"
    course.save
  end
end
