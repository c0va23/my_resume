require 'spec_helper'

describe ToolProject do
  it { should have_db_column(:version) }
  it { should belong_to(:project) }
  it { should belong_to(:tool) }
end
