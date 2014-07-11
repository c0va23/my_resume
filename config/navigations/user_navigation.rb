# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigation::Renderer::List

  navigation.items do |primary|
    primary.dom_class = "nav navbar-nav"
    primary.selected_class = "active"

    primary.item :main_page, t('user_navigation.main_page'), root_path
    primary.item :projects, t('user_navigation.projects'), projects_path, highlights_on: :subpath
    primary.item :tools, t('user_navigation.tools'), tools_path, highlights_on: :subpath
    primary.item :pages, t('user_navigation.pages'), pages_path, highlights_on: :subpath
  end

end
