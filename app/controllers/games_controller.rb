class GamesController < ApplicationController
  before_action :set_room
  before_action :set_game

  def index
  end

  def new
  end

  def show
  end

  def create
  end

  # じゃんけんの結果を出して次に案内する
  def update
    Hand.battle(@game)
    hands = @game.hands

    binding.pry

    # if choices.uniq.size == 1 || choices.uniq.size == 3
    #   game = @room.games.create
    #   redirect_to new_room_game_hand_path(@room, game)
    # else
    #   redirect_to room_game_path(@room, @game)
    # end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
