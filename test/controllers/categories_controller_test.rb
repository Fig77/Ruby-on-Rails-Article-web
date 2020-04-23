require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test 'can get to category/id' do
    get '/category/2'
    assert_response :success, 'Invalid path'
    assert(@controller.instance_variable_get(:@category_all) == [articles(:article_1),
                                                                 articles(:article_2), articles(:article_3)])
  end
end
