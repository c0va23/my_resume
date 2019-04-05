# frozen_string_literal: true

require 'spec_helper'

describe Admin::ToolsController do
  specify { expect(get('/admin/tools')).to route_to('admin/tools#index') }
  specify { expect(get('/admin/tools/new')).to route_to('admin/tools#new') }
  specify { expect(post('/admin/tools')).to route_to('admin/tools#create') }
  specify { expect(get('/admin/tools/123')).to route_to('admin/tools#show', id: '123') }
  specify { expect(get('/admin/tools/234/edit')).to route_to('admin/tools#edit', id: '234') }
  specify { expect(patch('/admin/tools/345')).to route_to('admin/tools#update', id: '345') }
  specify { expect(get('/admin/tools/456/delete')).to route_to('admin/tools#delete', id: '456') }
  specify { expect(delete('/admin/tools/567')).to route_to('admin/tools#destroy', id: '567') }
end
