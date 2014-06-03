# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigation::Renderer::List

  navigation.items do |primary|
    primary.dom_class = "nav navbar-nav"
    primary.selected_class = "active"

    primary.item :projects, t('admin_navigation.projects'), admin_projects_path, highlights_on: :subpath
  end

end
