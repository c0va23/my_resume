require 'spec_helper'

describe Tool do
  it { should have_db_column(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:tool_projects).dependent(:destroy) }
  it { should have_many(:projects).through(:tool_projects) }
  it { should have_many(:time_slots).through(:projects) }

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
      create(:time_slot, project: project, started_at: 2.month.ago, ended_at: 1.month.ago)
      create(:time_slot, project: project, started_at: 1.week.ago, ended_at: nil)
    end

    subject { tool.total_period }

    its(:days) { should == 1.month + 1.week }
  end
end
