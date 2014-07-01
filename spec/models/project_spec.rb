require 'spec_helper'

describe Project do
  it { should have_db_column(:name).of_type(:string).with_options(null: false) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:url).of_type(:string) }
  it { should have_db_column(:role).of_type(:text) }

  it { should validate_presence_of(:name) }

  it { should have_many(:screenshots).dependent(:destroy) }
  it { should have_many(:tool_projects).dependent(:destroy) }
  it { should have_many(:tools).through(:tool_projects) }
  it { should have_many(:time_slots).dependent(:destroy) }

  describe '#total_period' do
    let(:project) { create(:project) }
    let!(:time_slot1) { create(:time_slot, project: project, started_at: 60.days.ago, ended_at: 30.days.ago) }
    let!(:time_slot2) { create(:time_slot, project: project, started_at: 1.week.ago, ended_at: nil) }

    subject { project.total_period }

    its(:days) { should == 30.days + 1.week }
  end
end
