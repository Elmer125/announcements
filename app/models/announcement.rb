class Announcement < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { minimum: 5, maximum: 140 }

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    AnnouncementNotification.with(announcement: self).deliver_later(User.all)
  end

  def cleanup_notifications
    notifications_as_announcement.destroy_all
  end
end
