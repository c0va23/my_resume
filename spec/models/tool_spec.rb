require 'spec_helper'

describe Tool do
  it { should have_db_column(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:tool_projects).dependent(:destroy) }
  it { should have_many(:projects).through(:tool_projects) }

  describe 'scope :available_for' do
    let(:project) { create(:project) }
    let!(:appended_tool) { create(:tool) }
    let!(:other_tool) { create(:tool) }

    before { project.tools << appended_tool }

    subject { Tool.available_for(project) }

    it { should be_include(other_tool) }
    it { should_not be_include(appended_tool) }

  end
end
