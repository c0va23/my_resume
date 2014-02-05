# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigation::Renderer::List

  def menu_label(key)
    t(key, scope: [ 'admin_navigation', current_object_type ])
  end

  navigation.items do |primary|
    primary.dom_class = "nav nav-pills"
    primary.selected_class = "active"

    if current_object.try(:persisted?)
      primary.item :show_object, menu_label('show'), polymorphic_path([ :admin, current_object ])
      primary.item :edit_object, menu_label('edit'), polymorphic_path([ :edit, :admin, current_object ])
      primary.item :delete_object, menu_label('delete'), polymorphic_path([ :delete, :admin, current_object ])
    else
      primary.item :new_object, menu_label('new'), p(polymorphic_path([ :new, :admin, controller_name.singularize ]))
    end
  end

end
