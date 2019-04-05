# frozen_string_literal: true

class CompanyCollectionRepresenter < Representable::Decorator
  include Representable::JSON::Collection

  items extend: CompanyRepresenter
end
