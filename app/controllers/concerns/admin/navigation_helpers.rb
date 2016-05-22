module Admin
  module NavigationHelpers
    extend ActiveSupport::Concern

    included do
      helper_method :current_object, :current_object_type
    end

    protected

    def current_object
      instance_variable_get("@#{current_object_type}")
    end

    def current_object_type
      controller_name.singularize
    end
  end
end
