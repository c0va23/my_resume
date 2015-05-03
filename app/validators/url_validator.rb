class UrlValidator < ActiveModel::EachValidator

  def validate_each(record, attribute_name, value)
    unless URI.regexp(SUPPORTED_SCHEMAS) === value
      # i18n-tasks-use t("errors.messages.invalid_uri")
      record.errors.add(attribute_name, :invalid_uri)
    end
  end

private

  SUPPORTED_SCHEMAS = %w[
    http
    https
    mailto
  ]

end