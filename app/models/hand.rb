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

  validates_uniqueness_of :game_id, scope: [:user_id], message: 'の手の選択は完了しています。'
  validates_presence_of :choice

  enum choice: {
    rock: 1,
    scissors: 2,
    paper: 3
  }

  enum result: {
    undefined: 'undefined',
    win: 'win',
    lose: 'lose',
    draw: 'draw'
  }, _prefix: true

  def self.battle!(game)
    hands = game.hands

    choices = hands.map do |hand|
      Hand.choices[hand.choice]
    end.uniq

    Hand.transaction do
      # ひきわけ
      if choices.size == 1 || choices.size == 3
        hands.each do |hand|
          hand.result_draw!
        end

        return true
      end

      win = if Hand.is_win_one(*choices)
              choices.first
            else
              choices.second
            end

      hands.each do |hand|
        result = hand.choice == win ? :win : :lose
        hand.update(result: result)
      end
    end
    true
  rescue => e
    puts e
    return false
  end

  def self.is_win_one(one, two)
    (one - two) == -1 || (one - two) == 2
  end
end
