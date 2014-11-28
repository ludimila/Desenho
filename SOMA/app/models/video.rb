class Video < Resource

  alias_attribute :full_url, :document_file_name
  alias_attribute :youtube_id, :document_content_type

  URL_REGEX = /\A(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})\z/i
  validates :desciption, format: { with: URL_REGEX }, presence: true
  validates :full_url, presence: true

  def video?
    true
  end
end
