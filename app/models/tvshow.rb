class Tvshow < ActiveRecord::Base
  has_many :watchedshows
  has_many :users, through: :watchedshows

  validates :name, presence: true, uniqueness: true
end
