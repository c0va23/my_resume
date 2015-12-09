require 'spec_helper'

describe ApplicationHelper do

  describe '#format_period' do
    around(:each) do |example|
      I18n.with_locale(:en, &example)
    end

    let(:time_slot) { TimeSlot.new(started_at: period.ago.to_date, ended_at: nil) }

    subject { format_period(time_slot.period) }

    context 'period = 1.week' do
      let(:period) { 1.week }
      it { should == '1 week' }
    end

    context 'period = 3.week' do
      let(:period) { 3.week }
      it { should == '3 weeks' }
    end

    context 'period = 3.days' do
      let(:period) { 3.days }
      it { should eq '&nbsp;'.html_safe }
    end

    context 'period = 1.month' do
      let(:period) { 1.month }
      it { should == '1 month' }
    end

    context 'period = 2.months + 3.weeks' do
      let(:period) { 2.months + 3.weeks }
      it { should == '2 months 3 weeks' }
    end

    context 'period = 1.year' do
      let(:period) { 1.year }
      it { should == '1 year' }
    end

    context 'period = 1.year + 2.months' do
      let(:period) { 1.year + 2.months }
      it { should == '1 year 2 months' }
    end

    context 'period = 2.years + 5.months + 3.weeks' do
      let(:period) { 2.years + 5.months + 3.weeks }
      it { should == '2 years 5 months 3 weeks' }
    end
  end

end
