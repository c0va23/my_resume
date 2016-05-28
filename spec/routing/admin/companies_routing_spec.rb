require 'spec_helper'

describe Admin::CompaniesController do
  specify { get('admin/companies').should route_to('admin/companies#index') }
  specify { get('admin/companies/new').should route_to('admin/companies#new') }
  specify { post('admin/companies').should route_to('admin/companies#create') }
  specify { get('admin/companies/1').should route_to('admin/companies#show', id: '1') }
  specify { get('admin/companies/1/edit').should route_to('admin/companies#edit', id: '1') }
  specify { put('admin/companies/1').should route_to('admin/companies#update', id: '1') }
  specify { get('admin/companies/1/delete').should route_to('admin/companies#delete', id: '1') }
  specify { delete('admin/companies/1').should route_to('admin/companies#destroy', id: '1') }
end
