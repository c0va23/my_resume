# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigationRenderers::Bootstrap3

  navigation.items do |primary|
    primary.item :projects, t('admin_navigation.projects'), admin_projects_path, highlights_on: :subpath
  end

end
