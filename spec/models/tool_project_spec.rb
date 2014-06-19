require 'spec_helper'

describe ToolProject do
  it { should have_db_column(:version) }
  it { should belong_to(:project) }
  it { should belong_to(:tool) }
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:tool) }
  it { should validate_uniqueness_of(:tool_id).scoped_to(:project_id) }

  describe '#tool_name' do
    let(:tool) { create(:tool) }
    subject { create(:tool_project, tool: tool) }

    its(:tool_name) { should eq tool.name}
  end
end
