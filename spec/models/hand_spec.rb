# == Schema Information
#
# Table name: admin_users
#
#  id                     :uuid             not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Hand, type: :model do
  describe 'class method' do
    describe 'battle!' do
      let!(:user_win) { create(:user) }
      let!(:user_lose) { create(:user) }
      let!(:user_middle) { create(:user) }
      let!(:room) { create(:room, user: user_win) }
      let(:game) { create(:game, room: room) }

      context '勝敗がつく場合' do
        it '正常に算出される' do
          game.hands.create(user: user_win, choice: 1) # グー
          game.hands.create(user: user_lose, choice: 2) # チョキ
          game.hands.create(user: user_middle, choice: 1) # チョキ

          Hand.battle!(game)
          expect(user_win.hands.first.result).to eq "win"
          expect(user_lose.hands.first.result).to eq "lose"
          expect(user_middle.hands.first.result).to eq "win"
        end
      end

      context 'あいこの場合' do
        it '正常に算出される(3手)' do
          game.hands.create(user: user_win, choice: 1) # グー
          game.hands.create(user: user_lose, choice: 2) # チョキ
          game.hands.create(user: user_middle, choice: 3) # パー

          Hand.battle!(game)
          expect(user_win.hands.first.result).to eq "draw"
          expect(user_lose.hands.first.result).to eq "draw"
          expect(user_middle.hands.first.result).to eq "draw"
        end

        it '正常に算出される(1手)' do
          game.hands.create(user: user_win, choice: 1) # グー
          game.hands.create(user: user_lose, choice: 1) # グー
          game.hands.create(user: user_middle, choice: 1) # グー

          Hand.battle!(game)
          expect(user_win.hands.first.result).to eq "draw"
          expect(user_lose.hands.first.result).to eq "draw"
          expect(user_middle.hands.first.result).to eq "draw"
        end
      end
    end
  end
end
