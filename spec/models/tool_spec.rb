require 'spec_helper'

describe Tool do
  it { should have_db_column(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:tool_projects).dependent(:destroy) }
  it { should have_many(:projects).through(:tool_projects) }
end
