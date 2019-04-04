class TimeSlotCollectionRepresenter < Representable::Decorator
  include Representable::JSON::Collection

  items extend: TimeSlotRepresenter
end
