class HandsController < ApplicationController
  before_action :set_room, only: [:new, :create]
  before_action :set_game, only: [:new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    ActiveRecord::Base.transaction do
      @current_user.update!(name: hand_params[:user_name])
      @hand = @current_user.hands.create!(
        choice: hand_params[:choice].to_i,
        game_id: hand_params[:game_id]
      )
    rescue => e
      flash.now[:error] = e
      return render :new
    end

    respond_to do |f|
      f.turbo_stream
      f.html { redirect_to room_game_path(@room, @game) }
    end
  end

  private

  def hand_params
    params.permit(:user_name, :choice, :room_id, :game_id)
  end

  def set_room
    @current_user = current_or_guest_user
    @room = Room.find(params[:room_id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end
end
