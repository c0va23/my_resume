# frozen_string_literal: true

class Tool
  class Version
    attr_reader :label, :period

    def initialize(label, period)
      @label = label
      @period = period
    end

    def ==(other)
      label == other.label && period == other.period
    end

    def color
      "##{Digest::SHA1.hexdigest(label).first(6)}"
    end
  end
end
