require 'spec_helper'

describe Admin::ScreenshotsController do
  describe 'routes' do
    it { get('/admin/projects/1/screenshots').should route_to('admin/screenshots#index', project_id: '1') }
    it { get('/admin/projects/1/screenshots/new').should route_to('admin/screenshots#new', project_id: '1') }
    it { post('/admin/projects/1/screenshots').should route_to('admin/screenshots#create', project_id: '1') }
    it { get('/admin/projects/1/screenshots/2').should route_to('admin/screenshots#show', project_id: '1', id: '2') }
    it { get('/admin/projects/1/screenshots/2/edit').should route_to('admin/screenshots#edit', project_id: '1', id: '2') }
    it { patch('/admin/projects/1/screenshots/2').should route_to('admin/screenshots#update', project_id: '1', id: '2') }
    it { get('/admin/projects/1/screenshots/2/delete').should route_to('admin/screenshots#delete', project_id: '1', id: '2') }
    it { delete('/admin/projects/1/screenshots/2').should route_to('admin/screenshots#destroy', project_id: '1', id: '2') }
  end
end
