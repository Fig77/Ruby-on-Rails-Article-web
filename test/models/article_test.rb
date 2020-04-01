require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @false_article = Article.new('author_id' => 1, 'title' => 'asdsd', 'text' => 'a' * 78)
    @article = articles(:article_1)
  end

  test 'validations should be in place' do
    temp = @false_article
    2.times do |_x|
      temp.title = 'a' * [rand(0..4), rand(71..100)].sample
      assert_not(temp.valid?, 'Title should be greater than 5 and less than 70')
    end
    temp = @false_article
    temp.text = rand(0..69)
    assert_not(temp.valid?, 'Text should be bigger than 70 char')
  end

  test 'Article can have many categories' do
    assert_equal(2, @article.categories.size, 'Does not have a collection')
    assert_includes(@article.categories, categories(:two),
                    'Does not include all categories from this article')
  end

  test 'Article can have many votes' do
    assert_equal(2, @article.votes.size, 'Does not have a collection')
  end
end
