require 'spec_helper'

describe TimeSlot do
  it { should have_db_column(:started_at).of_type(:datetime) }
  it { should have_db_column(:ended_at).of_type(:datetime) }
  it { should belong_to(:project) }
  it { should validate_presence_of(:started_at) }
  it { should validate_presence_of(:project) }

  describe :ended_at do
    let(:valid_ended_at) { subject.started_at + 1.week }
    let(:first_invalid_ended_at) { subject.started_at - 1.week }
    let(:second_invalid_ended_at) { subject.started_at }

    subject { create(:time_slot) }

    it { should allow_value(valid_ended_at).for(:ended_at) }
    it { should_not allow_value(first_invalid_ended_at).for(:ended_at) }
    it { should_not allow_value(second_invalid_ended_at).for(:ended_at) }
  end
end
