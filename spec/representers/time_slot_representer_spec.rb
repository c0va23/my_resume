require 'spec_helper'

describe TimeSlotRepresenter do
  let(:time_slot) { build(:time_slot) }
  let(:representer) { time_slot.extend(described_class) }

  describe '#as_json' do
    subject { representer.as_json }

    it 'return start and end date' do
      is_expected.to include 'started_at' => time_slot.started_at.to_date,
                             'ended_at' => time_slot.ended_at_or_now.to_date
    end
  end
end
