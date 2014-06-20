require 'spec_helper'

describe Admin::TimeSlotsController do
  specify { get('/admin/projects/123/time_slots').should route_to('admin/time_slots#index', project_id: '123') }
  specify { get('/admin/projects/234/time_slots/new').should route_to('admin/time_slots#new', project_id: '234') }
  specify { post('/admin/projects/345/time_slots').should route_to('admin/time_slots#create', project_id: '345') }
  specify { get('/admin/projects/456/time_slots/567').should route_to('admin/time_slots#show', project_id: '456', id: '567') }
  specify { get('/admin/projects/678/time_slots/789/edit').should route_to('admin/time_slots#edit', project_id: '678', id: '789') }
  specify { patch('/admin/projects/890/time_slots/901').should route_to('admin/time_slots#update', project_id: '890', id: '901') }
  specify { get('/admin/projects/012/time_slots/123/delete').should route_to('admin/time_slots#delete', project_id: '012', id: '123') }
  specify { delete('/admin/projects/234/time_slots/345').should route_to('admin/time_slots#destroy', project_id: '234', id: '345') }
end
