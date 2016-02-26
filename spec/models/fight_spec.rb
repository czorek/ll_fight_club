require 'rails_helper'

RSpec.describe Fight, type: :model do
  it { is_expected.to validate_presence_of :winner }
  it { is_expected.to validate_presence_of :loser }
end
