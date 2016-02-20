class Fighter < ActiveRecord::Base
  validates :first_name, :last_name, :description, :avatar, :experience, presence: true
end
