# == Schema Information
#
# Table name: games
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :uuid             not null
#
# Indexes
#
#  index_games_on_room_id  (room_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#
class Game < ApplicationRecord
  belongs_to :room
  has_many :hands

  scope :yet_battled, -> {
    joins(:hands).where(hands: { result: 'undefined' }).or(where(hands: nil))
  }

  def battled?
    hands.first.result != Hand.results['undefined']
  end
end
