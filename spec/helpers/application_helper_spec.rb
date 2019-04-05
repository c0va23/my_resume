# frozen_string_literal: true

require 'spec_helper'

describe ApplicationHelper do
  describe '#format_period' do
    subject { format_period(time_slot.period) }

    around do |example|
      I18n.with_locale(:en, &example)
    end

    let(:time_slot) { TimeSlot.new(started_at: period.ago.to_date, ended_at: nil) }

    context 'when period is 1.week' do
      let(:period) { 1.week }

      it { is_expected.to eq '1 week' }
    end

    context 'when period is 3.week' do
      let(:period) { 3.weeks }

      it { is_expected.to eq '3 weeks' }
    end

    context 'when period is 3.days' do
      let(:period) { 3.days }

      it { is_expected.to eq '&nbsp;'.html_safe }
    end

    context 'when period is 1.month' do
      let(:period) { 1.month }

      it { is_expected.to eq '1 month' }
    end

    context 'when period is 2.months and 3.weeks' do
      let(:period) { 2.months + 3.weeks }

      it { is_expected.to eq '2 months 3 weeks' }
    end

    context 'when period is 1.year' do
      let(:period) { 1.year }

      it { is_expected.to eq '1 year' }
    end

    context 'when period is 1.year and 2.months' do
      let(:period) { 1.year + 2.months }

      it { is_expected.to eq '1 year 2 months' }
    end

    context 'when period is 2.years and 5.months and 3.weeks' do
      let(:period) { 2.years + 5.months + 3.weeks }

      it { is_expected.to eq '2 years 5 months 3 weeks' }
    end
  end
end
