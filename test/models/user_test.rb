require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  	@u1 = users(:one)
  end

  test 'User should have a Collection of Associations' do
  	col = 'Is not a collection'
    assert_kind_of(@u1.articles, Association::CollectionProxy.new, col)
  end
end
