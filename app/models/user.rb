class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :watchedshows
  has_many :tvshows, through: :watchedshows
  has_many :conversations, foreign_key: :sender_id
  has_many :friendships, foreign_key: :giver_id

  validates_integrity_of :avatar
  validates_processing_of :avatar

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

end
