class FightsController < ApplicationController
  before_action :select_fighters, only: [:new, :create]

  def show
  end

  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new
    if @fight.save
      redirect_to fight_path(@fight)
    else
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:winner_id, :loser_id)
  end

  def select_fighters
    challenger = preselected_fighter || current_user.fighters.find(params[:selected_challenger])
    opponent   = Fighter.find(params[:selected_opponent])
  end
end
