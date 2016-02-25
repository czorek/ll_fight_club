class Fighter < ActiveRecord::Base
  belongs_to :user
  has_many :skills
  has_many :won_fights, class_name: 'Fight', foreign_key: 'winner_id'
  has_many :lost_fights, class_name: 'Fight', foreign_key: 'loser_id'

  validates :skills, length: { minimum: 2, maximum: 8 }
  validates :first_name, :last_name, :description, :avatar, :experience, presence: true
  validates :experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :level, numericality: { only_integer: true }

  before_validation :assign_starter_skills

  scope :possible_opponents, -> { where(user != current_user) }

  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name} #{last_name}"
  end

  private

  def assign_starter_skills
    melee  = self.skills.build(name: 'melee', level: rand(6))
    knives = self.skills.build(name: 'knives', level: (5 - self.skills.first.level))
  end
end
