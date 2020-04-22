class CategoriesController < ApplicationController
  def show
    @category_all = Category.find(params[:id]).articles.includes(:author,
                                                                 [image_attachment: :blob]).ordered_by_most_recent
  end

  private

  def category_params
    params.require(:category).permit()
    # Still don't know what to permit since I am just showing them.
    # If they pass another id, then 404 should be shown.
  end
end
