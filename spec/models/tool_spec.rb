require 'spec_helper'

describe Tool do
  it { should have_db_column(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:tool_projects).dependent(:destroy) }
  it { should have_many(:projects).through(:tool_projects) }
  it { should have_many(:time_slots).through(:projects) }
  it { should belong_to(:tool_type) }

  describe 'scope :available_for' do
    let(:project) { create(:project) }
    let!(:appended_tool) { create(:tool) }
    let!(:other_tool) { create(:tool) }

    before { project.tools << appended_tool }

    subject { Tool.available_for(tool_project) }

    context 'new tool_project' do
      let(:tool_project) { build(:tool_project, project: project, tool: nil) }

      it { should be_include(other_tool) }
      it { should_not be_include(appended_tool) }
    end

    context 'edit tool_project' do
      let(:tool_project) { create(:tool_project, project: project, tool: other_tool) }

      it { should be_include(other_tool) }
      it { should_not be_include(appended_tool) }
    end
  end # scope :available_for

  describe '#total_period' do
    let(:tool) { create(:tool) }
    let(:project) { create(:project) }

    before do
      project.tools << tool
      create(:time_slot, project: project, started_at: 60.days.ago, ended_at: 30.days.ago)
      create(:time_slot, project: project, started_at: 1.week.ago, ended_at: nil)
    end

    subject { tool.total_period }

    it { should == 30.days + 1.week }
  end

  describe '#versions' do
    let(:tool) { create(:tool) }
    let(:version1) { '3.2' }
    let(:version2) { '4.0' }
    let!(:tool_project1) { create(:tool_project, version: version1, tool: tool) }
    let!(:tool_project2) { create(:tool_project, version: version1, tool: tool) }
    let!(:tool_project3) { create(:tool_project, version: version2, tool: tool) }
    let(:project1) { tool_project1.project }
    let(:project2) { tool_project2.project }
    let(:project3) { tool_project3.project }
    let!(:time_slot1) { create(:time_slot, project: project1, started_at: 2.week.ago, ended_at: 1.week.ago) }
    let!(:time_slot2) { create(:time_slot, project: project2, started_at: 4.week.ago, ended_at: 3.week.ago) }
    let!(:time_slot3) { create(:time_slot, project: project3, started_at: 2.month.ago, ended_at: 1.month.ago) }
    let!(:time_slot4) { create(:time_slot, project: project3, started_at: 4.month.ago, ended_at: 3.month.ago) }

    subject { tool.versions }

    it { should include(::Tool::Version.new(version1, time_slot1.period + time_slot2.period)) }
    it { should include(::Tool::Version.new(version2, time_slot3.period + time_slot4.period)) }

  end
end
