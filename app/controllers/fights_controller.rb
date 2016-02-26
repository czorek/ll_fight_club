class FightsController < ApplicationController
  before_action :possible_opponents, only: [:select_fighters, :new]
  before_action :available_fighters, only: [:select_fighters, :new]
  before_action :preselected_fighter, only: [:select_fighters, :new]

  def show
    @fight = Fight.find(params[:id])
  end

  def new
    @fight = Fight.new
  end

  def create
    @fighter  = preselected_fighter  || available_fighters.find(params[:selected_fighter])
    @opponent = preselected_opponent || possible_opponents.find(params[:selected_opponent])
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
  end

  private

  def fight_params
    params.require(:fight).permit(:winner_id, :loser_id, )
  end

  def available_fighters
    @available_fighters = current_user.fighters
  end

  def possible_opponents
    @possible_opponents |= Fighter.where.not(user: current_user)
  end
end
