# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:mobile) }
  it { is_expected.to validate_presence_of(:nickname) }
  it { is_expected.to validate_presence_of(:password_digest) }
  it { is_expected.to validate_uniqueness_of(:mobile) }
  it { is_expected.to validate_length_of(:nickname).is_at_least(2).is_at_most(10) }
  it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(16) }
  it { is_expected.to validate_length_of(:mobile).is_equal_to(11) }

  it { is_expected.to allow_value('13000000000').for(:mobile) }
  it { is_expected.not_to allow_values('1300000000a', '130000000011', '8888888888').for(:mobile) }

  describe '#with_token' do
  end
end
