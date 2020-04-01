class ArticlesController < ApplicationController
  def index
    articles_index
  end

  def new; end

  def create; end

  def show; end

  private

  def articles_index
    { # Refactor later into one query
      'feature' => Article.feature,
      'recent_categories' => Article::recent_all,
      #'selected_feature' => featured_from(3, @selected)
    }
  end
end
