require 'spec_helper'

describe Admin::ToolProjectsController do
  specify { get('/admin/projects/123/tool_projects').should route_to('admin/tool_projects#index', project_id: '123') }
  specify { get('/admin/projects/234/tool_projects/new').should route_to('admin/tool_projects#new', project_id: '234') }
  specify { post('/admin/projects/345/tool_projects').should route_to('admin/tool_projects#create', project_id: '345') }
  specify { get('/admin/projects/456/tool_projects/567').should route_to('admin/tool_projects#show', project_id: '456', id: '567') }
  specify { get('/admin/projects/678/tool_projects/789/edit').should route_to('admin/tool_projects#edit', project_id: '678', id: '789') }
  specify { patch('/admin/projects/890/tool_projects/901').should route_to('admin/tool_projects#update', project_id: '890', id: '901') }
  specify { get('/admin/projects/012/tool_projects/123/delete').should route_to('admin/tool_projects#delete', project_id: '012', id: '123') }
  specify { delete('/admin/projects/234/tool_projects/345').should route_to('admin/tool_projects#destroy', project_id: '234', id: '345') }
end
