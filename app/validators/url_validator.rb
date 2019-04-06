# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute_name, value)
    schemes = [*options[:scheme]]
    return if URI.regexp(schemes) === value

    # i18n-tasks-use t("errors.messages.invalid_uri")
    record.errors.add(attribute_name, :invalid_uri)
  end
end
