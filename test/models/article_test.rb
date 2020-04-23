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
    assert(Article.feature.first == articles(:article_1), 'Feature article should be
      number one')
    50.times do
      Vote.new('user' => users(:u_1), 'article' => articles(:article_2)).save
    end
    assert(Article.feature.first == articles(:article_2), 'After 50 positive votes,
      article number 2 should be featured')
    150.times do
      Vote.new('user' => users(:u_1), 'article' => articles(:article_1)).save
    end
    assert(Article.feature.first == articles(:article_1), 'After 150 positive votes,
     article 1 should befeatured')
    150.times do
      last = Vote.last
      last.positive = true
      last.save
    end
    assert(Article.feature.first == articles(:article_2),
           'After 150 downvotes article number 2 should be featured')
  end
end
