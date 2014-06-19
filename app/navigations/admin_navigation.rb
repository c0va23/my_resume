# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigation::Renderer::List

  navigation.items do |primary|
    primary.dom_class = "nav navbar-nav"
    primary.selected_class = "active"

    primary.item :projects, t('admin_navigation.projects'), admin_projects_path, highlights_on: :subpath do |projects_navigation|
      projects_navigation.dom_class = "nav nav-tabs"
      projects_navigation.selected_class = "active"

      if @project.try(:persisted?)
        projects_navigation.item :show_project, t('admin_navigation.show_project'), admin_project_path(@project)
        projects_navigation.item :edit_project, t('admin_navigation.edit_project'), edit_admin_project_path(@project)
        projects_navigation.item :delete_project, t('admin_navigation.delete_project'), delete_admin_project_path(@project)

        projects_navigation.item :screenshots, t('admin_navigation.screenshots'), admin_project_screenshots_path(@project) do |screenshots_navigation|
          screenshots_navigation.dom_class = "nav nav-tabs"
          screenshots_navigation.selected_class = "active"

          if @screenshot.try(:persisted?)
            screenshots_navigation.item :show_screenshot, t('admin_navigation.show_screenshot'), admin_project_screenshot_path(@project, @screenshot)
            screenshots_navigation.item :edit_screenshot, t('admin_navigation.edit_screenshot'), edit_admin_project_screenshot_path(@project, @screenshot)
            screenshots_navigation.item :delete_screenshot, t('admin_navigation.delete_screenshot'), delete_admin_project_screenshot_path(@project, @screenshot)
          else
            screenshots_navigation.item :new_screenshot, t('admin_navigation.new_screenshot'), new_admin_project_screenshot_path(@project)
          end
        end

        projects_navigation.item :tool_projects, t('admin_navigation.tool_projects'), admin_project_tool_projects_path(@project) do |tool_projects_navigation|
          tool_projects_navigation.dom_class = "nav nav-tabs"
          tool_projects_navigation.selected_class = "active"

          if @tool_project.try(:persisted?)
            tool_projects_navigation.item :show_tool_project, t('admin_navigation.show_tool_project'), admin_project_tool_project_path(@project, @tool_project)
            tool_projects_navigation.item :edit_tool_project, t('admin_navigation.edit_tool_project'), edit_admin_project_tool_project_path(@project, @tool_project)
            tool_projects_navigation.item :delete_tool_project, t('admin_navigation.delete_tool_project'), delete_admin_project_tool_project_path(@project, @tool_project)
          else
            tool_projects_navigation.item :new_tool_project, t('admin_navigation.new_tool_project'), new_admin_project_tool_project_path(@project)
          end
        end

      else
        projects_navigation.item :new_project, t('admin_navigation.new_project'), new_admin_project_path
      end
    end

    primary.item :tools, t('admin_navigation.tools'), admin_tools_path, highlights_on: :subpath do |tools_navigation|
      tools_navigation.dom_class = "nav nav-pills"
      tools_navigation.selected_class = "active"
      if @tool.try(:persisted?)
        tools_navigation.item :show_tool, t('admin_navigation.show_tool'), admin_tool_path(@tool)
        tools_navigation.item :edit_tool, t('admin_navigation.edit_tool'), edit_admin_tool_path(@tool)
        tools_navigation.item :delete_tool, t('admin_navigation.delete_tool'), delete_admin_tool_path(@tool)
      else
        tools_navigation.item :new_tool, t('admin_navigation.new_tool'), new_admin_tool_path
      end
    end
  end

end
