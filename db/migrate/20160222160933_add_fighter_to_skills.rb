class AddFighterToSkills < ActiveRecord::Migration
  def change
    add_reference :skills, :fighter, index: true, foreign_key: true
  end
end
