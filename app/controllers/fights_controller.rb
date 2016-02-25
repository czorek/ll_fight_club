class FightsController < ApplicationController
  def show
  end

  def new
    @fight = Fight.new
    @fighter  = preselected_fighter  || current_user.fighters.find(params[:selected_fighter])
    @opponent = preselected_opponent || Fighter.possible_opponents.find(params[:selected_opponent])
  end

  def create
    @fight = Fight.build(fight_params)
    if @fight.save
      redirect_to fight_path(@fight)
    else
      flash.now[:alert] = t('.error')
      render :new
    end
  end

  def select_fighters
    @fighters  = current_user.fighters
    @opponents = Fighter.possible_opponents
  end

  private

  def fight_params
    params.require(:fight).permit(:winner_id, :loser_id)
  end
end
