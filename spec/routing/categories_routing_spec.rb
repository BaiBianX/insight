# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/categories').to route_to('categories#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/categories/1').to route_to('categories#show', id: '1', format: :json)
    end
  end
end
