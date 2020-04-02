require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @most_recent = [articles(:article_1).id, articles(:article_1).id]
  end

  test 'Will get every feature from category' do
    articles_id = []
    Category.all.includes(:articles).each do |x|
      articles_id.push(x.articles.ordered_by_most_recent.first.id) unless x.articles.count.zero?
    end
    assert(articles_id == @most_recent)
  end
end
