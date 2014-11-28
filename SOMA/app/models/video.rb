class Video < Resource
  before_save :get_youtube_code
  alias_attribute :full_url, :document_file_name
  alias_attribute :youtube_code, :document_content_type

  URL_REGEX = /\A(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})\z/i
  validates :description, presence: true
  validates :full_url, presence: true, format: { with: URL_REGEX }
  validates :youtube_code, uniqueness: true

  def video?
    true
  end

  def self.per_page
    3
  end

  private

    def get_youtube_code
      self.youtube_code = self.full_url.split("=").last
      if self.youtube_code.nil?
        self.youtube_code = self.full_url.split("/").last
      end
    end
end
