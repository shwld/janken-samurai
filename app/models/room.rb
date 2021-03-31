# == Schema Information
#
# Table name: rooms
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Room < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :games, dependent: :destroy
  broadcasts
end
