require 'spec_helper'

describe Tool::Version do
  describe '#color' do
    let(:random_version) { -> { "#{rand(10)}.#{rand(10)}.#{rand(10)}" } }

    let(:version1) { described_class.new(random_version.call, 1.week) }
    let(:version2) { described_class.new(random_version.call, 2.weeks) }

    it 'return color in CSS format' do
      expect(version1.color).to match(/\A#[0-9a-f]{6}\z/)
    end

    it 'return different value for differen version' do
      expect(version1.color).not_to eq version2.color
    end
  end
end
