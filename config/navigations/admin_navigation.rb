# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigation::Renderer::List

  navigation.items do |primary|
    primary.dom_class = "nav navbar-nav"
    primary.selected_class = "active"

    primary.item :projects, t('admin.projects.index.projects'), admin_projects_path, highlights_on: :subpath do |projects_navigation|
      projects_navigation.dom_class = "nav nav-tabs"
      projects_navigation.selected_class = "active"

      if @project.try(:persisted?)
        projects_navigation.item :show_project, t('admin.projects.show.show_project'), admin_project_path(@project)
        projects_navigation.item :edit_project, t('admin.projects.edit.edit_project'), edit_admin_project_path(@project)
        projects_navigation.item :delete_project, t('admin.projects.delete.delete_project'), delete_admin_project_path(@project)

        projects_navigation.item :screenshots, t('admin.screenshots.index.screenshots'), admin_project_screenshots_path(@project) do |screenshots_navigation|
          screenshots_navigation.dom_class = "nav nav-tabs"
          screenshots_navigation.selected_class = "active"

          if @screenshot.try(:persisted?)
            screenshots_navigation.item :show_screenshot, t('admin.screenshots.show.show_screenshot'), admin_project_screenshot_path(@project, @screenshot)
            screenshots_navigation.item :edit_screenshot, t('admin.screenshots.edit.edit_screenshot'), edit_admin_project_screenshot_path(@project, @screenshot)
            screenshots_navigation.item :delete_screenshot, t('admin.screenshots.delete.delete_screenshot'), delete_admin_project_screenshot_path(@project, @screenshot)
          else
            screenshots_navigation.item :new_screenshot, t('admin.screenshots.new.new_screenshot'), new_admin_project_screenshot_path(@project)
          end
        end

        projects_navigation.item :tool_projects, t('admin.tool_projects.index.tool_projects'), admin_project_tool_projects_path(@project) do |tool_projects_navigation|
          tool_projects_navigation.dom_class = "nav nav-tabs"
          tool_projects_navigation.selected_class = "active"

          if @tool_project.try(:persisted?)
            tool_projects_navigation.item :show_tool_project, t('admin.tool_projects.show.show_tool_project'), admin_project_tool_project_path(@project, @tool_project)
            tool_projects_navigation.item :edit_tool_project, t('admin.tool_projects.edit.edit_tool_project'), edit_admin_project_tool_project_path(@project, @tool_project)
            tool_projects_navigation.item :delete_tool_project, t('admin.tool_projects.delete.delete_tool_project'), delete_admin_project_tool_project_path(@project, @tool_project)
          else
            tool_projects_navigation.item :new_tool_project, t('admin.tool_projects.new.new_tool_project'), new_admin_project_tool_project_path(@project)
          end
        end

        projects_navigation.item :time_slots, t('admin.time_slots.index.time_slots'), [ :admin, @project, :time_slots ] do |time_slots_navigation|
          time_slots_navigation.dom_class = "nav nav-tabs"
          time_slots_navigation.selected_class = "active"

          if @time_slot.try(:persisted?)
            time_slots_navigation.item :show_time_slot, t('admin.time_slots.show.show_time_slot'), [ :admin, @project, @time_slot ]
            time_slots_navigation.item :edit_time_slot, t('admin.time_slots.edit.edit_time_slot'), [ :edit, :admin, @project, @time_slot ]
            time_slots_navigation.item :delete_time_slot, t('admin.time_slots.delete.delete_time_slot'), [ :delete, :admin, @project, @time_slot ]
          else
            time_slots_navigation.item :new_time_slot, t('admin.time_slots.new.new_time_slot'), [ :new, :admin, @project, :time_slot ]
          end
        end

      else
        projects_navigation.item :new_project, t('admin.projects.new.new_project'), new_admin_project_path
      end
    end

    primary.item :tools, t('admin.tools.index.tools'), admin_tools_path, highlights_on: :subpath do |tools_navigation|
      tools_navigation.dom_class = "nav nav-pills"
      tools_navigation.selected_class = "active"
      if @tool.try(:persisted?)
        tools_navigation.item :show_tool, t('admin.tools.show.show_tool'), admin_tool_path(@tool)
        tools_navigation.item :edit_tool, t('admin.tools.edit.edit_tool'), edit_admin_tool_path(@tool)
        tools_navigation.item :delete_tool, t('admin.tools.delete.delete_tool'), delete_admin_tool_path(@tool)
      else
        tools_navigation.item :new_tool, t('admin.tools.new.new_tool'), new_admin_tool_path
      end
    end

    primary.item :pages, t('admin.pages.index.pages'), admin_pages_path, highlights_on: :subpath do |pages_navigation|
      pages_navigation.dom_class = "nav nav-pills"
      pages_navigation.selected_class = "active"
      if @page.try(:persisted?)
        pages_navigation.item :show_page, t('admin.pages.show.show_page'), admin_page_path(@page)
        pages_navigation.item :edit_page, t('admin.pages.edit.edit_page'), edit_admin_page_path(@page)
        pages_navigation.item :delete_page, t('admin.pages.delete.delete_page'), delete_admin_page_path(@page)
      else
        pages_navigation.item :new_page, t('admin.pages.new.new_page'), new_admin_page_path
      end
    end

    primary.item :tool_types, t("admin.tool_types.index.tool_types"), admin_tool_types_path, highlights_on: :subpath do |tool_types_navigation|
      tool_types_navigation.dom_class = "nav nav-pills"
      tool_types_navigation.selected_class = "active"

      if @tool_type.try(:persisted?)
        tool_types_navigation.item :show_tool_type, t('admin.tool_types.show.show_tool_type'), admin_tool_type_path
        tool_types_navigation.item :edit_tool_type, t('admin.tool_types.edit.edit_tool_type'), edit_admin_tool_type_path
        tool_types_navigation.item :delete_tool_type, t('admin.tool_types.delete.delete_tool_type'), delete_admin_tool_type_path
      else
        tool_types_navigation.item :new_tool_type, t('admin.tool_types.new.new_tool_type'), new_admin_tool_type_path
      end

    end # tool_types

    primary.item :contacts, t('admin.contacts.index.contacts'), admin_contacts_path, highlights_on: :subpath do |contacts_navigation|
      contacts_navigation.dom_class = "nav nav-pills"
      contacts_navigation.selected_class = "active"

      if @contact.try(:persisted?)
        contacts_navigation.item :show_contact, t('admin.contacts.show.show_contact'), admin_contact_path
        contacts_navigation.item :edit_contact, t('admin.contacts.edit.edit_contact'), edit_admin_contact_path
        contacts_navigation.item :delete_contact, t('admin.contacts.delete.delete_contact'), delete_admin_contact_path
      else
        contacts_navigation.item :new_tool_type, t('admin.contacts.new.new_contact'), new_admin_contact_path
      end

    end # contacts

  end

end
