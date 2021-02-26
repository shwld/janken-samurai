class GamesController < ApplicationController
  before_action :set_game

  def index
  end

  def new
  end

  def show
  end

  def create
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
