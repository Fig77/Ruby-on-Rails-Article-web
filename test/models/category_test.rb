require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @most_recent = [articles(:article_1), articles(:article_1)]
    @featured_from_0 = [articles(:article_1), articles(:article_2)]
  end

  test 'Will get every new article from category' do
    articles_id = Category.new_all
    assert(articles_id == @most_recent)
  end

  test 'Will get every featured article from category' do
    articles = Category.features(categories(:analysis).id)
    assert(articles.eql?(@featured_from_0))
  end
end
