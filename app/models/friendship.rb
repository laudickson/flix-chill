class Friendship < ActiveRecord::Base
  belongs_to :giver, foreign_key: :giver_id, class_name: 'User'

  belongs_to :reciever, foreign_key:
  :reciever_id, class_name: 'User'

  validates_uniqueness_of :giver_id, scope: :reciever_id

  scope :involving, ->(user) do
    where("friendships.giver_id =? OR friendships.reciever_id =?", user.id, user.id)
  end

  scope :between, ->(giver_id, reciever_id) do
    where("(friendships.giver_id = ? AND friendships.reciever_id =?) OR (friendships.giver_id = ? AND friendships.reciever_id =?)", giver_id, reciever_id, reciever_id, giver_id)
  end
end
