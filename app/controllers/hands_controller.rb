class HandsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @current_user = current_or_guest_user
    @room = @current_user.rooms.find(params[:room_id])
    @game = @room.games.find(params[:game_id])
  end

  def create
    puts hand_params
  end

  private

  def hand_params
    params.permit(:user_name, :choice, :room_id, :game_id)
  end
end
