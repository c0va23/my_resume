require 'spec_helper'

describe ApplicationHelper do

  describe '#format_period' do
    let(:time_slot) { build(:time_slot, started_at: 8.weeks.ago, ended_at: 4.weeks.ago) }

    subject { format_period(time_slot.period) }

    it { should == I18n.t('application_helper.weeks', count: 4) }
  end

end
