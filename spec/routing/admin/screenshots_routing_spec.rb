require 'spec_helper'

describe Admin::ScreenshotsController do
  describe 'routes' do
    it { expect(get('/admin/projects/1/screenshots')).to route_to('admin/screenshots#index', project_id: '1') }
    it { expect(get('/admin/projects/1/screenshots/new')).to route_to('admin/screenshots#new', project_id: '1') }
    it { expect(post('/admin/projects/1/screenshots')).to route_to('admin/screenshots#create', project_id: '1') }

    specify do
      expect(get('/admin/projects/1/screenshots/2')).to route_to('admin/screenshots#show', project_id: '1', id: '2')
    end

    specify do
      expect(get('/admin/projects/1/screenshots/2/edit')).to route_to(
        'admin/screenshots#edit',
        project_id: '1', id: '2',
      )
    end

    specify do
      expect(patch('/admin/projects/1/screenshots/2')).to route_to('admin/screenshots#update', project_id: '1', id: '2')
    end

    specify do
      expect(get('/admin/projects/1/screenshots/2/delete')).to route_to(
        'admin/screenshots#delete',
        project_id: '1',
        id: '2',
      )
    end

    specify do
      expect(delete('/admin/projects/1/screenshots/2')).to route_to(
        'admin/screenshots#destroy',
        project_id: '1',
        id: '2',
      )
    end
  end
end
