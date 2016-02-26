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
  before_save :check_for_level_up, if: lambda { |f| f.experience_changed? }

  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name} #{last_name}"
  end

  private

  def assign_starter_skills
    return unless skills.empty?
    melee  = self.skills.build(name: 'melee', level: rand(6))
    knives = self.skills.build(name: 'knives', level: (5 - self.skills.first.level))
  end

  def check_for_level_up
    exp = (experience / 1000).to_i
    case exp
    when 3
      self.increment(:level, 1)
    when 7
      self.increment(:level, 1)
    when 15
      self.increment(:level, 1)
    when 31
      self.increment(:level, 1)
    when 47
      self.increment(:level, 1)
    end
  end
end
