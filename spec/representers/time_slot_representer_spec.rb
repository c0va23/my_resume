require 'spec_helper'

describe TimeSlotRepresenter do
  let(:project) { build(:project, id: 1) }
  let(:time_slot) { build(:time_slot, project: project) }
  let(:representer) { time_slot.extend(described_class) }

  describe '#to_hash' do
    subject { representer.to_hash }

    it 'return start and end date' do
      is_expected.to include 'started_at' => time_slot.started_at.beginning_of_day,
                             'ended_at' => time_slot.ended_at_or_now.end_of_day,
                             'project_link' => "/projects/#{project.id}"
    end
  end
end
