# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before :each do
    request.accept = 'application/json'
  end
  describe 'POST #create' do
    let(:user) { create :user }
    let(:session_params) { { mobile: user.mobile, password: user.password } }

    it 'creates a new token for user' do
      post :create, params: { session: session_params }
    end
  end
end
