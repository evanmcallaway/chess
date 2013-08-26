class GamesController < ApplicationController

  def index
    @games = current_user.games
  end
  
  def show
  end
  
  def new
    @game = Game.new
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def create
    begin
      Game.transaction do
        current_user.games.create params[:game].permit(:pgn)
      end
    end
    redirect_to games_path
  end
  
  def update
    @game = Game.find(params[:id])
    @game.update_attributes(params[:game].permit(:pgn))
    redirect_to games_path
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  def export
    @game = Game.find(params[:id])
    send_data @game.pgn
  end

end
