class ArticlesController < ApplicationController
  def index
    @index_data = articles_index
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
    {
      'feature' => Article.feature,
      'new_from_categories' => Article.new_all
      # 'featured_from_category_all' => Category.features(1)
    }
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
