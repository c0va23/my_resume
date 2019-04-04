require 'spec_helper'

RSpec.describe CompanyRepresenter do
  let(:company) { build(:company, id: 1) }
  let(:representable) { described_class.new(company) }

  describe '#to_hash' do
    subject { representable.to_hash }

    it 'return valid company data' do
      is_expected.to include 'id' => company.id,
                             'name' => company.name,
                             'started_at' => company.started_at
    end
  end
end
