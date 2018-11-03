require 'spec_helper'

describe Admin::TimeSlotsController do
  specify { expect(get('/admin/projects/123/time_slots')).to route_to('admin/time_slots#index', project_id: '123') }
  specify { expect(get('/admin/projects/234/time_slots/new')).to route_to('admin/time_slots#new', project_id: '234') }
  specify { expect(post('/admin/projects/345/time_slots')).to route_to('admin/time_slots#create', project_id: '345') }

  specify do
    expect(get('/admin/projects/456/time_slots/567')).to route_to('admin/time_slots#show', project_id: '456', id: '567')
  end

  specify do
    expect(get('/admin/projects/678/time_slots/789/edit')).to route_to 'admin/time_slots#edit',
                                                                   project_id: '678',
                                                                   id: '789'
  end

  specify do
    expect(patch('/admin/projects/890/time_slots/901')).to route_to('admin/time_slots#update', project_id: '890', id: '901')
  end

  specify do
    expect(get('/admin/projects/012/time_slots/123/delete')).to route_to 'admin/time_slots#delete',
                                                                     project_id: '012',
                                                                     id: '123'
  end

  specify do
    expect(delete('/admin/projects/234/time_slots/345')).to route_to 'admin/time_slots#destroy',
                                                                 project_id: '234',
                                                                 id: '345'
  end
end
