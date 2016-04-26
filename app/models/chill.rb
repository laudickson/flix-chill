class Chill < ActiveRecord::Base
  belongs_to :user

  validates :match, presence: true, uniqueness: {scope: :user_id}
  validate :cannot_add_self

  private

  def cannot_add_self
    errors.add(:match, "You cannot match yourself. Unless you're really that narcissistic") if user_id == match
  end
end
