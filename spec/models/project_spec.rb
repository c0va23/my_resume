require 'spec_helper'

describe Project do
  it { should have_db_column(:name).of_type(:string).with_options(null: false) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:url).of_type(:string) }

  it { should validate_presence_of(:name) }

  it { should have_many(:screenshots).dependent(:destroy) }
end
