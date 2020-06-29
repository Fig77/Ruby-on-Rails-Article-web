require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'Categories can have many articles' do
    assert(categories(:analysis).articles.count == 3)
  end

  test 'Categories can have new articles' do
    users(:u_1).articles.new('title' => 't' * 50,
                             'text' => 't' * 150, 'category_ids' => [2]).save
    assert(categories(:analysis).articles.count == 4)
  end
end
