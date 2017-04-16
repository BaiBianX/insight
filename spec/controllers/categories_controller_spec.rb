# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    it 'assigns all categories as @categories' do
      category = create :category
      get :index, params: {}
      expect(assigns(:categories)).to eq([category])
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested category as @category' do
      category = create :category
      get :show, params: { id: category.to_param }
      expect(assigns(:category)).to eq(category)
      expect(response).to render_template :show
    end
  end
end
