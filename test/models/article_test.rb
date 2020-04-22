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
    assert(Article.feature.first == articles(:article_1))
    50.times {
      Vote.new('user'=>users(:u_1), 'article'=>articles(:article_2)).save
    }
    assert(Article.feature.first == articles(:article_2))
    150.times {
      Vote.new('user'=>users(:u_1), 'article'=>articles(:article_1)).save
    }
    assert(Article.feature.first == articles(:article_1))
    150.times {
      last = Vote.last
      last.positive = true
      last.save
    }
    assert(Article.feature.first == articles(:article_2))
  end
end
