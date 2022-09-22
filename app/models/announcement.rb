class Announcement < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { minimum: 5, maximum: 140 }
  has_many :user_announcements, dependent: :destroy
  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'
  validate :validate_date

  def validate_date
    errors.add(:expire, "can't be in the past") if expire < Date.today
  end

  private

  def notify_recipient
    AnnouncementNotification.with(announcement: self).deliver_later(User.all)
  end

  def cleanup_notifications
    notifications_as_announcement.destroy_all
  end
end
