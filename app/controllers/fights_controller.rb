class FightsController < ApplicationController
  before_action :possible_opponents, only: :new
  before_action :available_fighters, only: :new
  before_action :preselected_fighter, only: :new

  def show
    @fight = Fight.find(params[:id])
  end

  def new
    @fight = Fight.new
  end

  def create
    @fighter  = preselected_fighter || available_fighters.find(params[:fight][:selected_fighter])
    @opponent = possible_opponents.find(params[:fight][:selected_opponent])

    result = Fight.determine_winner(@fighter, @opponent)
    winner = result[:winner]
    loser = winner == @fighter ? @opponent : @fighter

    @fight = Fight.new(winner: winner, loser: loser)

    if @fight.save
      winner = @fight.winner
      winner.increment(:experience, 100)
      winner.save
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
    params.require(:fight).permit(:winner_id, :loser_id, :selected_opponent, :selected_fighter)
  end

  def available_fighters
    @available_fighters = current_user.fighters
  end

  def possible_opponents
    @possible_opponents ||= Fighter.where.not(user: current_user)
  end
end
