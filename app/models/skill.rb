class Skill < ActiveRecord::Base
  extend Enumerize

  validates :name, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 6 }

  enumerize :name, in: %w(melee knives guns axes lasers chainsaws rockets tanks).freeze, i18n_scope: 'skills'

  belongs_to :fighter
end
