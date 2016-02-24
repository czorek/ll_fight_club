require 'rails_helper'

RSpec.describe Fighter, type: :model do
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :avatar }
  it { is_expected.to validate_presence_of :experience }
  it { is_expected.to validate_numericality_of :experience }

  let(:rambo)  { create(:fighter_with_skills) }
  let(:arthur) { create(:fighter_with_skills, first_name: 'King', last_name: 'Arthur') }

  describe 'name method' do
    it 'returns a full fighter name' do
      expect(rambo.name).to eq 'John Rambo'
    end
  end
end
