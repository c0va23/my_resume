# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigationRenderers::Bootstrap3

  navigation.items do |primary|
    # primary.item :projects, 'projects', admin_projects_path
  end

end
