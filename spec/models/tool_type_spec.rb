require 'spec_helper'

describe ToolType do
  it { should have_db_column(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:tools).dependent(:nullify) }
end
