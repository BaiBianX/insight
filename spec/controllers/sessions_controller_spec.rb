# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) { request.accept = 'application/json' }

  describe 'POST #create' do
    let(:user) { create :user }
    let(:session_params) { { mobile: user.mobile, password: user.password } }

    it 'creates a new token for user' do
      post :create, params: { session: session_params }
      expect(assigns(:user)).to eq(user)
      expect(response).to render_template :create
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create :user }

    context 'with authentication' do
      before(:each) { request.headers['authorization'] = "Token token=#{user.set_auth_token}" }
      it 'removes user auth token from database' do
        delete :destroy, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
        expect(response).to render_template :destroy
      end
    end

    context 'without authentication' do
      it 'returns 401' do
        delete :destroy, params: { id: user.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
