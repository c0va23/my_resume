# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CompanyRepresenter do
  let(:company) { build(:company, id: 1) }
  let(:representable) { described_class.new(company) }

  describe '#to_hash' do
    subject(:company_hash) { representable.to_hash }

    it 'return valid company data' do
      expect(company_hash).to include 'id' => company.id,
                                      'name' => company.name,
                                      'started_at' => company.started_at
    end
  end
end
