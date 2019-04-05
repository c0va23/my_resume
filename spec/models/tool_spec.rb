require 'spec_helper'

describe Tool do
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_many(:tool_projects).dependent(:destroy) }
  it { is_expected.to have_many(:projects).through(:tool_projects) }
  it { is_expected.to have_many(:time_slots).through(:projects) }
  it { is_expected.to belong_to(:tool_type) }

  describe 'scope :available_for' do
    subject { described_class.available_for(tool_project) }

    let(:project) { create(:project) }
    let!(:appended_tool) { create(:tool) }
    let!(:other_tool) { create(:tool) }

    before { project.tools << appended_tool }

    context 'when new tool_project' do
      let(:tool_project) { build(:tool_project, project: project, tool: nil) }

      it { is_expected.to be_include(other_tool) }
      it { is_expected.not_to be_include(appended_tool) }
    end

    context 'when exists tool_project' do
      let(:tool_project) { create(:tool_project, project: project, tool: other_tool) }

      it { is_expected.to be_include(other_tool) }
      it { is_expected.not_to be_include(appended_tool) }
    end
  end

  describe '#total_period' do
    subject { tool.total_period }

    let(:tool) { create(:tool) }
    let(:project) { create(:project) }

    before do
      project.tools << tool
      create(:time_slot, project: project, started_at: 60.days.ago, ended_at: 30.days.ago)
      create(:time_slot, project: project, started_at: 1.week.ago, ended_at: nil)
    end

    it { is_expected.to eq 30.days + 1.week }
  end

  describe '#versions' do
    subject { tool.versions }

    let(:tool) { create(:tool) }
    let(:version1) { '3.2' }
    let(:version2) { '4.0' }
    let!(:tool_project1) { create(:tool_project, version: version1, tool: tool) }
    let!(:tool_project2) { create(:tool_project, version: version1, tool: tool) }
    let!(:tool_project3) { create(:tool_project, version: version2, tool: tool) }
    let(:project1) { tool_project1.project }
    let(:project2) { tool_project2.project }
    let(:project3) { tool_project3.project }
    let!(:time_slot1) { create(:time_slot, project: project1, started_at: 2.weeks.ago, ended_at: 1.week.ago) }
    let!(:time_slot2) { create(:time_slot, project: project2, started_at: 4.weeks.ago, ended_at: 3.weeks.ago) }
    let!(:time_slot3) { create(:time_slot, project: project3, started_at: 6.weeks.ago, ended_at: 5.weeks.ago) }
    let!(:time_slot4) { create(:time_slot, project: project3, started_at: 8.weeks.ago, ended_at: 7.weeks.ago) }

    it { is_expected.to include(::Tool::Version.new(version1, time_slot1.period + time_slot2.period)) }
    it { is_expected.to include(::Tool::Version.new(version2, time_slot3.period + time_slot4.period)) }
  end
end
