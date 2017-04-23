# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i(show update destroy)

  def index
    @categories = Category.all
  end

  def show; end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
