class Fighter < ActiveRecord::Base
  belongs_to :user
  has_many :skills

  validates :skills, length: { minimum: 2, maximum: 8 }
  validates :first_name, :last_name, :description, :avatar, :experience, presence: true
  validates :experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_create :assign_starter_skills

  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name} #{last_name}"
  end

  private

  def assign_starter_skills
    
  end
end
