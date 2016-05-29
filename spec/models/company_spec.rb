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

  describe 'validations' do
    subject { build :company }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:started_at) }
    it 'should not allow value of the future' do
      should_not allow_value(1.day.since).for(:started_at)
    end

    it { should allow_value(nil).for(:ended_at) }
    it 'ended_at should be great than ended_at' do
      should_not allow_value(subject.started_at - 1.day).for(:ended_at)
    end

    let(:valid_http_url) do
      FFaker::Internet.uri(%i(http https).sample) + "/#{FFaker::Internet.slug}"
    end
    let(:valid_not_http_url) do
      FFaker::Internet.uri(%i(ftp phone).sample) + "/#{FFaker::Internet.slug}"
    end

    it 'shoulda allow valid http url for site_url' do
      should allow_value(valid_http_url).for(:site_url)
    end

    it 'shoulda not allow valid hot http url for site_url' do
      should_not allow_value(valid_not_http_url).for(:site_url)
    end

    it 'should_not allow invalid url for site_url' do
      should_not allow_value(FFaker::Internet.slug).for(:site_url)
    end
  end
end
