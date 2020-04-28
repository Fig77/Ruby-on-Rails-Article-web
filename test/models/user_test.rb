require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User should have several articles' do
    assert(users(:u_1).articles.count == 2, 'User does not have 2 articles')
  end

  test 'User can create an article and assign it to himself' do
  	users(:u_1).articles.new('title' => 'a' * 50, 'text' => 't' * 150).save
    assert(users(:u_1).articles.count == 3,
           'User could not create an article an assign it to himself')
  end
end
