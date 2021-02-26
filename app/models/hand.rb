# == Schema Information
#
# Table name: hands
#
#  id         :uuid             not null, primary key
#  choice     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_hands_on_game_id  (game_id)
#  index_hands_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (user_id => users.id)
#
class Hand < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates_uniqueness_of :user_id, scope: [:game_id]
  validates_presence_of :choice

  enum choice: {
    rock: 1,
    scissors: 2,
    paper: 3
  }
end
