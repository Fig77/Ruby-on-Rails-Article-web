require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'Categories can have many articles' do
    assert(categories(:analysis).articles.count == 3)
  end
end
