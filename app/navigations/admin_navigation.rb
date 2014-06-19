# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigation::Renderer::List

  navigation.items do |primary|
    primary.dom_class = "nav navbar-nav"
    primary.selected_class = "active"

    primary.item :projects, t('admin_navigation.projects'), admin_projects_path, highlights_on: :subpath do |project_navigation|
      project_navigation.dom_class = "nav nav-pills"
      project_navigation.selected_class = "active"

      if @project.try(:persisted?)
        project_navigation.item :show_project, t('admin_navigation.show'), admin_project_path(@project)
        project_navigation.item :edit_project, t('admin_navigation.edit'), edit_admin_project_path(@project)
        project_navigation.item :delete_project, t('admin_navigation.delete'), delete_admin_project_path(@project)

        project_navigation.item :screenshots, t('admin_navigation.screenshots'), admin_project_screenshots_path(@project)
        project_navigation.item :new_screenshots, t('admin_navigation.new_screenshots'), new_admin_project_screenshot_path(@project)
      else
        project_navigation.item :new_object, t('admin_navigation.new'), new_admin_project_path
      end
    end

    primary.item :tools, t('admin_navigation.tools'), admin_tools_path, highlights_on: :subpath do |tool_navigation|
      tool_navigation.dom_class = "nav nav-pills"
      tool_navigation.selected_class = "active"
      if @tool.try(:persisted?)
        tool_navigation.item :show_tool, t('admin_navigation.show'), admin_tool_path(@tool)
        tool_navigation.item :edit_tool, t('admin_navigation.edit'), edit_admin_tool_path(@tool)
        tool_navigation.item :delete_tool, t('admin_navigation.delete'), delete_admin_tool_path(@tool)
      else
        tool_navigation.item :new_tool, t('admin_navigation.new'), new_admin_tool_path
      end
    end
  end

end
