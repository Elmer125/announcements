class Announcement < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { minimum: 5, maximum: 140 }
end
