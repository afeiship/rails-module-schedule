class Post < ApplicationRecord
  PUBLISH_WAITING, PUBLISHED = 'not_published', 'published'

  scope :publish_waiting, -> {  where(status: Post::PUBLISH_WAITING) }
  scope :ready_for_publish, -> { where('publish_at <= ?', Time.now) }

  # Method to make post published!
  # Warn: it doesnt check if it is time to publish! Just do that.
  def publish_now!
    puts 'publish noew...'
    self.status = Post::PUBLISHED
    self.published_at = self.publish_at
    save!
  end
end
