require 'spec_helper'

describe Company do
  describe 'columns' do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:description).of_type(:text).with_options(null: true) }
    it { should have_db_column(:site_url).of_type(:string).with_options(null: true) }
    it { should have_db_column(:started_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:ended_at).of_type(:datetime).with_options(null: true) }
  end

  describe 'indexes' do
    it { should have_db_index(:name).unique(true) }
  end
end
