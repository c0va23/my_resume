require 'spec_helper'

describe TimeSlotRepresenter do
  let(:time_slot) { build(:time_slot) }
  let(:representer) { time_slot.extend(described_class) }

  describe '#to_hash' do
    subject { representer.to_hash }

    it 'return start and end date' do
      is_expected.to include 'started_at' => time_slot.started_at.beginning_of_day,
                             'ended_at' => time_slot.ended_at_or_now.end_of_day
    end
  end
end
