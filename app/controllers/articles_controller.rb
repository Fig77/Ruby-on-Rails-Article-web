class ArticlesController < ApplicationController
  def index
    articles_index
  end

  def new; end

  def create; end

  def show; end

  private

  def articles_index
    temp = { # Refactor later into one query
      'feature' => Articles.feature,
      'recent_categories' => Articles.recent_all,
      'selected_feature' => featured_from(3, @selected)
    }
  end
end
