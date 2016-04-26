class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :watchedshows
  has_many :tvshows, through: :watchedshows

  has_many :chills

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar

  validates_presence_of :avatar
  validates_integrity_of :avatar
  validates_processing_of :avatar

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

end
