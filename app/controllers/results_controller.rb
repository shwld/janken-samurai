class ResultsController < ApplicationController
  before_action :set_room
  before_action :set_game

  def show
  end

  private

  def set_room
    @current_user = current_or_guest_user
    @room = Room.find(params[:room_id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end
end
