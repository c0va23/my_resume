# frozen_string_literal: true

require 'spec_helper'

describe Company do
  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:text).with_options(null: true) }
    it { is_expected.to have_db_column(:site_url).of_type(:string).with_options(null: true) }
    it { is_expected.to have_db_column(:started_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:ended_at).of_type(:datetime).with_options(null: true) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:name).unique(true) }
  end

  describe 'validations' do
    subject(:company) { build :company }

    let(:valid_http_url) do
      FFaker::Internet.uri(%i[http https].sample) + "/#{FFaker::Internet.slug}"
    end
    let(:valid_not_http_url) do
      FFaker::Internet.uri(%i[ftp phone].sample) + "/#{FFaker::Internet.slug}"
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }

    it { is_expected.to validate_presence_of(:started_at) }
    it 'not allow value of the future' do
      expect(company).not_to allow_value(1.day.since).for(:started_at)
    end

    it { is_expected.to allow_value(nil).for(:ended_at) }
    it 'ended_at is_expected.to be great than ended_at' do
      expect(company).not_to allow_value(company.started_at - 1.day).for(:ended_at)
    end

    it 'allow valid http url for site_url' do
      expect(company).to allow_value(valid_http_url).for(:site_url)
    end

    it 'not allow valid hot http url for site_url' do
      expect(company).not_to allow_value(valid_not_http_url).for(:site_url)
    end

    it 'not allow invalid url for site_url' do
      expect(company).not_to allow_value(FFaker::Internet.slug).for(:site_url)
    end
  end
end
