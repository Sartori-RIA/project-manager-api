require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:start_date) }
      it { is_expected.to validate_presence_of(:start_date) }
    end
    context 'with be has associations' do
      it { is_expected.to belong_to(:project) }
    end
  end
end
