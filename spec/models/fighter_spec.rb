require 'rails_helper'

RSpec.describe Fighter, type: :model do
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :avatar }
  it { is_expected.to validate_presence_of :experience }
  it { is_expected.to validate_numericality_of :experience }
  it { is_expected.to have_many :won_fights }
  it { is_expected.to have_many :lost_fights }
  it { is_expected.to have_many :skills }
  it { is_expected.to belong_to :user }

  let(:rambo)  { create(:fighter, experience: 1000) }
  let(:arthur) { create(:fighter, first_name: 'King', last_name: 'Arthur') }

  describe 'name method' do
    it 'returns a full fighter name' do
      expect(arthur.name).to eq 'King Arthur'
    end
  end

  describe 'skills' do
    it 'are assigned on create' do
      expect(arthur.skills.pluck(:name)).to eq ['melee', 'knives']
    end
  end

  describe 'level' do
    it 'changes on certain experience values' do
      expect(rambo.level).to eq 2
    end

    it 'adds new skills' do
      expect(rambo.skills.pluck(:name)).to include 'guns'
    end
  end
end
