class User < ApplicationRecord
  has_many :announcements, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  validates_presence_of :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
