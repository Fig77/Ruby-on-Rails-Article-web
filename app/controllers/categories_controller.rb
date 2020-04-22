class CategoriesController < ApplicationController
  def show
    @category_all = Category.find(params[:id]).articles.includes(:author, [image_attachment: :blob]).ordered_by_most_recent
  end
end
