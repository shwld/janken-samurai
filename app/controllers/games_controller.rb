class GamesController < ApplicationController
  before_action :set_room
  before_action :set_game, except: [:index, :create]

  def index
  end

  def new
  end

  def show
  end

  def create
    # 勝敗が決まってないゲームがあればそこにいくようにしたい
    # うまく動いてない
    @game = @room.games.yet_battled.order(:created_at).first || @room.games.new
    if @game.persisted? || @game.save
      redirect_to room_game_path(@room, @game)
    else
      puts 'どうしよう'
    end
  end

  # じゃんけんの結果を出して次に案内する
  def update
    if Hand.battle!(@game)
      redirect_to room_game_result_path(@room, @game)
    else
      puts 'どうしよう'
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
