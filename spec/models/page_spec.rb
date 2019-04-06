# frozen_string_literal: true

require 'spec_helper'

describe Page do
  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:content).of_type(:text) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }
end
