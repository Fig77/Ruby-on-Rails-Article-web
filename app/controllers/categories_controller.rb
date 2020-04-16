class CategoriesController < ApplicationController
  def show
    @category_all = Category.find(params[:id]).articles.ordered_by_most_recent
  end
end
