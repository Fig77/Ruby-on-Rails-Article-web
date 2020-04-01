require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  	@u1 = users(:u_1)
  	@artic = articles(:article_1)
  end
 
  test 'User should have a collection of articles' do
    assert_equal(1, @u1.articles.size, 'Does not have a collection')
    assert_includes(@u1.articles, @artic, 'Collection does not contain
    	           user article')
  end

  test 'User can have many votes' do
  	assert_equal(1, @u1.votes.size, 'Does not have a collection')
  end
end
