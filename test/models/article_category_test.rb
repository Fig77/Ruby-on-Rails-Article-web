require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase
  test 'will return latest articlos from each category' do
    artic = ArticleCategory.new_all
    array_artic = [artic.first.article, artic.second.article]
    assert(array_artic == [articles(:article_1), articles(:article_1)])
  end
end
