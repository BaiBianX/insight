# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) { request.accept = 'application/json' }

  let(:valid_attributes) do
    { mobile: '13000000000', password: 'password', password_confirmation: 'password', nickname: 'Draven' }
  end

  let(:invalid_attributes) do
    { mobile: '130', password: 'password', password_confirmation: 'password', nickname: 'Draven' }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all users as @users' do
      user = User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :show, params: { id: user.to_param }, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: valid_attributes }, session: valid_session
        end.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, params: { user: invalid_attributes }, session: valid_session
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { mobile: '18000000000' }
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        user.reload
        expect(user.mobile).to eq(new_attributes[:mobile])
      end

      it 'assigns the requested user as @user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'with invalid params' do
      it 'assigns the user as @user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(assigns(:user)).to eq(user)
      end
    end
  end
end
