require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'Article has one author' do
    assert(articles(:article_1).author.id == 1)
  end

  test 'Article has one or many categories' do
    assert(articles(:article_1).categories.count == 2)
  end

  test 'Article can have many votes' do
    assert_equal(2, articles(:article_1).votes.count)
  end

  test 'feature will get the one with most votes' do
    article = Article.feature.first
    assert(article == articles(:article_1))
  end
end
