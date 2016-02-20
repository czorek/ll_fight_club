require 'rails_helper'

RSpec.describe Fighter, type: :model do
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :avatar }
  it { is_expected.to validate_presence_of :experience }
end
