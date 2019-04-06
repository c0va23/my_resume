# frozen_string_literal: true

class CompanyRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :name
  property :started_at
  property :ended_at
end
