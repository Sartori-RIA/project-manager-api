# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:start_date) }
      it { is_expected.to validate_presence_of(:end_date) }
    end
    context 'with be has associations' do
      it { is_expected.to have_many(:activities) }
    end
  end
end
