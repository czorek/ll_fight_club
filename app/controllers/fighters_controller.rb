class FightersController < ApplicationController
  def index
    @fighters = current_user.fighters
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = current_user.fighters.build(fighter_params)
    if @fighter.save
      redirect_to fighter_path(@fighter), notice: t("fighter.created")
    else
      # flash.now(alert: t("fighter.not_saved"))
      render :new
    end
  end

  private

  def fighter_params
    params.require(:fighter).permit(:first_name, :last_name, :description, :avatar)
  end
end
