require 'spec_helper'

describe Admin::ToolsController do
  specify { get('/admin/tools').should route_to('admin/tools#index') }
  specify { get('/admin/tools/new').should route_to('admin/tools#new') }
  specify { post('/admin/tools').should route_to('admin/tools#create') }
  specify { get('/admin/tools/123').should route_to('admin/tools#show', id: '123') }
  specify { get('/admin/tools/234/edit').should route_to('admin/tools#edit', id: '234') }
  specify { patch('/admin/tools/345').should route_to('admin/tools#update', id: '345') }
  specify { get('/admin/tools/456/delete').should route_to('admin/tools#delete', id: '456') }
  specify { delete('/admin/tools/567').should route_to('admin/tools#destroy', id: '567') }
end
