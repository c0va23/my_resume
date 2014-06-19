require 'spec_helper'

describe Tool do
  it { should have_db_column(:name) }
  it { should validate_presence_of(:name) }
end
