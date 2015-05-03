require 'spec_helper'

describe Contact do
  it { should have_db_column(:label) }
  it { should have_db_column(:url) }
end
