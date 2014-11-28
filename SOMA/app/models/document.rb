class Document < Resource
  before_destroy :destroy_documents

  SECRET_NAME = Array.new(5){[*"A".."Z", *"0".."9"].sample}.join
  has_attached_file :document ,{
    styles: {
      pdf_thumbnail: ["100x100#", "jpg"],
      :small  => ["150x150>", "jpg"],
      :medium => ["200x200", "jpg"] 
    }
  }
  validates_attachment :document, :presence => true,
    :content_type => { :content_type => "application/pdf" },
    :size => { :in => 0..5.megabytes }
  validates_attachment_file_name :document, :matches => [/pdf\Z/]

  def get_readable_name
    name = self.document_file_name.split('.').first
    name.titleize
  end

  def document?
    true
  end

  private
    def destroy_documents
      self.document.destroy
    end
end
