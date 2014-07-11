require 'spec_helper'

describe Page do
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:content).of_type(:text) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
