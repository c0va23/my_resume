# frozen_string_literal: true

require 'spec_helper'

describe Contact do
  it { is_expected.to have_db_column(:label) }
  it { is_expected.to have_db_column(:url) }
end
