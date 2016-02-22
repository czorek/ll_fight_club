class Fighter < ActiveRecord::Base
  validates :first_name, :last_name, :description, :avatar, :experience, presence: true
  validates :experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user

  mount_uploader :avatar, AvatarUploader
end
