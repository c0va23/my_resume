require 'spec_helper'

describe Screenshot do
  describe 'columns' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:token).of_type(:string) }
    it { should have_db_column(:project_id).of_type(:integer) }
  end

  describe 'validation' do
    it { should ensure_length_of(:name).is_at_most(100) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:description).is_at_most(1000) }
    it { should validate_presence_of(:token) }
  end

  describe 'token' do
    its(:token) { should be_a(ScreenshotUploader) }
  end

  describe 'associations' do
    it { should belong_to(:project) }
  end
end
