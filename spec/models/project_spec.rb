require 'spec_helper'

describe Project do
  it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:description).of_type(:text) }
  it { is_expected.to have_db_column(:url).of_type(:string) }
  it { is_expected.to have_db_column(:role).of_type(:text) }

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to have_many(:screenshots).dependent(:destroy) }
  it { is_expected.to have_many(:tool_projects).dependent(:destroy) }
  it { is_expected.to have_many(:tools).through(:tool_projects) }
  it { is_expected.to have_many(:time_slots).dependent(:destroy) }
  it { is_expected.to belong_to(:company) }

  it { is_expected.to delegate_method(:name).to(:company).with_prefix }

  describe '#total_period' do
    subject { project.total_period }

    let(:project) { create(:project) }

    before do
      create(:time_slot, project: project, started_at: 60.days.ago, ended_at: 30.days.ago)
      create(:time_slot, project: project, started_at: 1.week.ago, ended_at: nil)
    end

    it { is_expected.to eq 30.days + 1.week }
  end
end
