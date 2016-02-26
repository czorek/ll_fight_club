class Fight < ActiveRecord::Base
  belongs_to :winner, class_name: 'Fighter'
  belongs_to :loser,  class_name: 'Fighter'

  validates :winner, :loser, presence: true

  attr_accessor :selected_fighter, :selected_opponent

  def self.determine_winner(fighter, opponent)
    result = { fighter: 0, opponent: 0, winner: nil }
    level_diff = Fight.level_diff(fighter.level, opponent.level)
    fighters_dice = level_diff > 0 ? 6 + level_diff : 6
    opponents_dice = level_diff < 0 ? 6 - level_diff : 6

    fighter.skills.pluck(:name, :id).to_h.each do |name, level|
      opponent_skill_level = opponent.skills.find_by(name: name).level

      fighters_score  = level + rand(fighters_dice)
      opponents_score = opponent_skill_level + rand(opponents_dice)

      fighters_score > opponents_score ? result[:fighter] += 1 : result[:opponent] += 1
    end

    if result[:fighter] == result[:opponent] && fighter.skills.count % 2 == 0
      loop do
        fighters_break_score = rand(fighters_dice)
        opponents_break_score = rand(opponents_dice)

        unless fighters_break_score == opponents_break_score
          fighters_break_score > opponents_break_score ? result[:fighter] += 1 : result[:opponent] += 1
          break
        end
      end
    end

    result[:winner] = result[:fighter] > result[:opponent] ? fighter : opponent
    return result
  end

  def self.level_diff(fighter_level, opponents_level)
    fighter_level - opponents_level
  end
end
