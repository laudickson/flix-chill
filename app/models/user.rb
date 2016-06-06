class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :watchedshows
  has_many :tvshows, through: :watchedshows

  has_many :conversations, foreign_key: :sender_id

  has_many :friendships
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "match_id"

  # Once a user requests to connect, they obtain a 'friendship status':
  # 1) list of existing matches
  has_many :active_matches, -> { where(friendships: { approved: true}) }, through: :friendships, source: :match
  # 2) list of the users who are also on the list of the users on list 1
  has_many :passive_matches, -> { where(friendships: { approved: true}) }, through: :passive_friendships, source: :user
  # 3) list of sent pending matches (yet to be accepted)
  has_many :pending_matches, -> { where(friendships: { approved: false}) }, through: :friendships, source: :match
  # 4) list of the users waiting to accept pending matches
  has_many :requested_matches, -> { where(friendships: { approved: false}) }, through: :passive_friendships, source: :user


  validates_integrity_of :avatar
  validates_processing_of :avatar

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  def matches
    active_matches | passive_matches
  end

end
