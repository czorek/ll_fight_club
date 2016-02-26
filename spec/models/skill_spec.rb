require 'rails_helper'

RSpec.describe Skill, type: :model do
  it { is_expected.to belong_to :fighter}
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :level }
  it { is_expected.to enumerize :name }
end
