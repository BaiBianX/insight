# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/sessions').to route_to('sessions#create', format: :json)
    end

    it 'routes to #destroy via DELETE' do
      expect(delete: '/api/sessions/1').to route_to('sessions#destroy', id: '1', format: :json)
    end
  end
end
