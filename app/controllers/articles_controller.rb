class ArticlesController < ApplicationController
  def index
    articles_index
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    render :new unless @article.save
  end

  def show; end

  private

  def articles_index
    
    { # Refactor later into one query
      'feature' => Article.feature,
      #'recent_all' => Category.recent_all
      #'selected_feature' => featured_from(3, @selected)
    }
  end
end
