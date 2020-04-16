require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test 'can get to category/id' do
    get '/category/1'
    assert_response :success
  end
end
