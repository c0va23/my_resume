module CompanyCollectionRepresenter
  include Roar::JSON
  include Representable::JSON::Collection

  items do
    property :name
    property :started_at
    property :ended_at
  end
end
