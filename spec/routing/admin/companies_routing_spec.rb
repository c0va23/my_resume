require 'spec_helper'

describe Admin::CompaniesController do
  specify { expect(get('admin/companies')).to route_to('admin/companies#index') }
  specify { expect(get('admin/companies/new')).to route_to('admin/companies#new') }
  specify { expect(post('admin/companies')).to route_to('admin/companies#create') }
  specify { expect(get('admin/companies/1')).to route_to('admin/companies#show', id: '1') }
  specify { expect(get('admin/companies/1/edit')).to route_to('admin/companies#edit', id: '1') }
  specify { expect(put('admin/companies/1')).to route_to('admin/companies#update', id: '1') }
  specify { expect(get('admin/companies/1/delete')).to route_to('admin/companies#delete', id: '1') }
  specify { expect(delete('admin/companies/1')).to route_to('admin/companies#destroy', id: '1') }
end
