module TimeStepCollectionRepresenter
  include Roar::Representer::JSON
  include Representable::JSON::Collection

  items extend: TimeStepRepresenter

end
