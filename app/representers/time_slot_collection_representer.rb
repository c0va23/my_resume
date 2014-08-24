module TimeSlotCollectionRepresenter
  include Roar::Representer::JSON
  include Representable::JSON::Collection

  items extend: TimeSlotRepresenter

end
