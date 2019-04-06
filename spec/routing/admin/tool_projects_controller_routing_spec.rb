# frozen_string_literal: true

require 'spec_helper'

describe Admin::ToolProjectsController do
  specify do
    expect(get('/admin/projects/123/tool_projects')).to route_to('admin/tool_projects#index', project_id: '123')
  end
  specify do
    expect(get('/admin/projects/234/tool_projects/new')).to route_to('admin/tool_projects#new', project_id: '234')
  end
  specify do
    expect(post('/admin/projects/345/tool_projects')).to route_to('admin/tool_projects#create', project_id: '345')
  end

  specify do
    expect(get('/admin/projects/456/tool_projects/567')).to \
      route_to 'admin/tool_projects#show', project_id: '456', id: '567'
  end

  specify do
    expect(get('/admin/projects/678/tool_projects/789/edit')).to \
      route_to 'admin/tool_projects#edit', project_id: '678', id: '789'
  end

  specify do
    expect(patch('/admin/projects/890/tool_projects/901')).to \
      route_to 'admin/tool_projects#update', project_id: '890', id: '901'
  end

  specify do
    expect(get('/admin/projects/012/tool_projects/123/delete')).to \
      route_to 'admin/tool_projects#delete', project_id: '012', id: '123'
  end

  specify do
    expect(delete('/admin/projects/234/tool_projects/345')).to \
      route_to 'admin/tool_projects#destroy', project_id: '234', id: '345'
  end
end
