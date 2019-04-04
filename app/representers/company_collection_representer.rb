class CompanyCollectionRepresenter < Representable::Decorator
  include Representable::JSON::Collection

  items extend: CompanyRepresenter
end
