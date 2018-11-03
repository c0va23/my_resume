require 'spec_helper'

describe ToolProject do
  it { is_expected.to have_db_column(:version) }
  it { is_expected.to belong_to(:project) }
  it { is_expected.to belong_to(:tool) }
  it { is_expected.to validate_presence_of(:project) }
  it { is_expected.to validate_presence_of(:tool) }
  it { is_expected.to validate_uniqueness_of(:tool_id).scoped_to(:project_id) }

  describe '#tool_name' do
    let(:tool) { create(:tool) }
    subject { create(:tool_project, tool: tool) }

    its(:tool_name) { is_expected.to eq tool.name }
  end
end
