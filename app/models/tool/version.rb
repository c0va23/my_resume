class Tool::Version < Struct.new(:label, :period)
  def color
    "##{Digest::SHA1.hexdigest(self.label).first(6)}"
  end
end
