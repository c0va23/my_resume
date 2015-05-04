class UrlValidator < ActiveModel::EachValidator

  def validate_each(record, attribute_name, value)
    schemes = [ *self.options[:scheme] ]
    unless URI.regexp(schemes) === value
      # i18n-tasks-use t("errors.messages.invalid_uri")
      record.errors.add(attribute_name, :invalid_uri)
    end
  end

end