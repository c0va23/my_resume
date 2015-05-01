module TimeSlotCollectionRepresenter
  include Roar::JSON
  include Representable::JSON::Collection

  items extend: TimeSlotRepresenter

end
