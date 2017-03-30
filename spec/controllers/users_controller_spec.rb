# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) { request.accept = 'application/json' }

  describe 'GET #index' do
    let!(:user) { create :user }
    it 'assigns all users as @users' do
      get :index, params: {}
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    let(:user) { create :user }
    it 'assigns the requested user as @user' do
      get :show, params: { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end

  let(:valid_attributes) { { mobile: '13000000000', password: 'password', nickname: 'Draven' } }
  let(:invalid_attributes) { { mobile: '130', password: 'password', nickname: 'Draven' } }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, params: { user: valid_attributes }
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, params: { user: invalid_attributes }
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe 'PUT #update' do
    let(:user) { create :user }

    context 'with valid params' do
      let(:new_attributes) { { mobile: '18000000000' } }

      context 'without authentication' do
        it 'returns 401' do
          put :update, params: { id: user.to_param, user: new_attributes }
          expect(response).to have_http_status(:unauthorized)
        end
      end

      context 'with authentication' do
        before(:each) do
          @request.headers['authorization'] = "Token token=#{user.set_auth_token}"
        end

        it 'updates the requested user' do
          put :update, params: { id: user.to_param, user: new_attributes }
          user.reload
          expect(user.mobile).to eq(new_attributes[:mobile])
        end

        it 'assigns the requested user as @user' do
          put :update, params: { id: user.to_param, user: valid_attributes }
          expect(assigns(:user)).to eq(user)
        end
      end
    end

    context 'with invalid params' do
      context 'with authentication' do
        it 'assigns the user as @user' do
          @request.headers['authorization'] = "Token token=#{user.set_auth_token}"
          put :update, params: { id: user.to_param, user: invalid_attributes }
          expect(assigns(:user)).to eq(user)
        end
      end
    end
  end
end
