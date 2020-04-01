require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
  	@false_article = Article.new
  	@article = articles(:article_1)
  end

  test 'validations should be in place' do
    @false_article.title = 'A' * rand(0..69)
    a_size = @false_article.title.size
    assert_not(a_size >= 5 || a_size <= 70, 'title should have
                    between 5 and 70 characters')
    @false_article.text = 'a'*rand(0..74)
    assert_not(@false_article.text.size > 75, 'text should be
    	      greater than 75 length')

  end
end
