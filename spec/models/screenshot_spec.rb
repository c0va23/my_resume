require 'spec_helper'

describe Screenshot do
  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:image).of_type(:string) }
    it { is_expected.to have_db_column(:project_id).of_type(:integer) }
  end

  describe 'validation' do
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:description).is_at_most(1000) }
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'image' do
    its(:image) { is_expected.to be_a(ScreenshotUploader) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:project) }
  end
end
