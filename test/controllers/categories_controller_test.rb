require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test 'can get to category/id' do
    get '/category/2'
    assert_response :success, 'Invalid path'
    assert(@controller.instance_variable_get(:@category_all) == [articles(:article_1),
                                                                 articles(:article_2), articles(:article_3)])
  end


  test 'Categories are not link to articles that do not have their category' do
  	assert_not(categories(:review).articles.include? articles(:article_2) )
  end
end
