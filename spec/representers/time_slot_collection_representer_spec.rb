require 'spec_helper'

RSpec.describe TimeSlotCollectionRepresenter do
  let(:project) { build(:project, id: 2) }
  let(:time_slots) { build_list(:time_slot, 3, project: project) }
  let(:representer) { described_class.new(time_slots) }

  describe '#to_hash' do
    subject { representer.to_hash }

    it 'return list of time slot hashes' do
      is_expected.to eq time_slots.map(&TimeSlotRepresenter.method(:new)).map(&:to_hash)
    end
  end
end
