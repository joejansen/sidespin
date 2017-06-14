class Challenge < ApplicationRecord
  belongs_to :home_user, class_name: 'User'
  belongs_to :away_user, class_name: 'User'

  scope :pending, -> { where(completed_at: nil, rejected_at: nil) }

  validates :home_user, :away_user, presence: true

  def available_opponents
    home_user.available_opponents.map do |user|
      [user.full_name, user.id]
    end
  end
end