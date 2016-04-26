class Watchedshow < ActiveRecord::Base
  belongs_to :user
  belongs_to :tvshow

  validates :tvshow_id, presence: true
  validates :user_id, presence: true, uniqueness: {scope: :tvshow_id}
  validates :rating, presence: true

  RATING = [
  [1, "1"],
  [2, "2"],
  [3, "3"],
  [4, "4"],
  [5, "5"]
  ]
end
