class ArticlesController < ApplicationController
  include ApplicationHelper

  def index
    @index_data = articles_index
  end

  def new
    if signed_in?
      @article = current_user.articles.new
    else
      redirect_to user_session_path
    end
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to article_path(@article.id)
    else
      flash.now[:alert] = @article.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def articles_index
    return nil if Article.count.zero?

    {
      'feature' => Article.feature.includes(:author).with_attached_image.first,
      'new_from_categories' => ArticleCategory.new_all
    }
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
