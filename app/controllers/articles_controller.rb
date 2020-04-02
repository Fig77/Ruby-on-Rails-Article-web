class ArticlesController < ApplicationController
  def index
    articles_index
  end

  def new
    if signed_in?
      @article = current_user.articles.new
    else
      redirect_to index_path
    end
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.save ? (redirect_to index_path) : (render :new)
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def articles_index
    { # Refactor later into one query
      'feature' => Article.feature
      # 'recent_all' => Category.recent_all
      # 'selected_feature' => featured_from(3, @selected)
    }
    @articles_all = Article.feature
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
