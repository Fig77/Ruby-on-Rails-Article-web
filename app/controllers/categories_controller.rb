class CategoriesController < ApplicationController
  def show
    @category_all = Category.find(params[:id]).articles
  end
end
