require 'spec_helper'

describe TimeSlot do
  it { should have_db_column(:started_at).of_type(:date) }
  it { should have_db_column(:ended_at).of_type(:date) }
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

  it { should delegate_method(:name).to(:project).with_prefix }
  it { should delegate_method(:company_name).to(:project) }

  describe 'validate date range' do
    let!(:other_time_slot) { create(:time_slot, started_at: 2.weeks.ago, ended_at: 2.weeks.since) }

    before { subject.valid? }

    context 'left crossing' do
      subject { build(:time_slot, started_at: Date.current, ended_at: 1.month.since) }

      its(:errors) { should have_key(:date_range) }
    end

    context 'rigth crossing' do
      subject { build(:time_slot, started_at: 1.month.ago, ended_at: Date.current) }

      its(:errors) { should have_key(:date_range) }
    end

    context 'inner crossing ' do
      subject { build(:time_slot, started_at: 1.week.ago, ended_at: 1.week.since) }

      its(:errors) { should have_key(:date_range) }
    end

    context 'outer crossing' do
      subject { build(:time_slot, started_at: 1.month.ago, ended_at: 1.month.since) }

      its(:errors) { should have_key(:date_range) }
    end

    context 'full crossing' do
      subject { build(:time_slot, started_at: other_time_slot.started_at, ended_at: other_time_slot.ended_at) }

      its(:errors) { should have_key(:date_range) }
    end

    context 'left border crossing' do
      subject do
        build :time_slot,
              started_at: other_time_slot.ended_at + 1.day,
              ended_at: other_time_slot.ended_at + 1.week
      end

      its(:errors) { should_not have_key(:date_range) }
    end

    context 'rigth border crossing' do
      subject do
        build :time_slot,
              started_at: other_time_slot.started_at - 1.week,
              ended_at: other_time_slot.started_at - 1.day
      end

      its(:errors) { should_not have_key(:date_range) }
    end

    context 'only started_at' do
      subject { build(:time_slot, started_at: other_time_slot.started_at - 1.week, ended_at: nil) }

      its(:errors) { should have_key(:date_range) }
    end
  end

  describe 'update date range' do
    subject { create(:time_slot, started_at: 1.month.ago, ended_at: 1.month.since) }

    before { subject.update_attributes(started_at: 1.week.ago, ended_at: 1.week.since) }

    its(:errors) { should_not have_key(:date_range) }
  end

  describe '#period' do
    subject { time_slot.period }

    context 'with ended_at' do
      let(:time_slot) { build(:time_slot, started_at: 1.week.ago, ended_at: 1.week.since) }

      it { should == 2.weeks }
    end

    context 'wihtout ended_at' do
      let(:time_slot) { build(:time_slot, started_at: 1.week.ago, ended_at: nil) }

      it { should == 1.week }
    end
  end

  describe '::total_period' do
    let!(:time_slot1) { create(:time_slot, started_at: 60.days.ago, ended_at: 30.days.ago) }
    let!(:time_slot2) { create(:time_slot, started_at: 14.days.ago, ended_at: 7.days.ago) }

    subject { TimeSlot.total_period }

    it { should == 37.days }
  end
end
