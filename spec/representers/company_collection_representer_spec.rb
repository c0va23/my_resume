require 'spec_helper'

RSpec.describe CompanyCollectionRepresenter do
  let(:companies) { build_list(:company, 3) }
  let(:representer) { described_class.new(companies) }

  describe '#to_hash' do
    subject { representer.to_hash }

    it 'return list of company hashes' do
      is_expected.to eq companies.map(&CompanyRepresenter.method(:new)).map(&:to_hash)
    end
  end
end
