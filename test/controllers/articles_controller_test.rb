require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  ## Testing routes
  test 'should get index' do
    get index_path
    assert_response :success, 'Could not get into index'
  end

  test 'should get create' do
    get article_path(articles(:article_1).id)
    assert_response :success, 'coulod not get into create'
  end

  test 'should get show' do
    get article_path(articles(:article_1).id)
    assert_response :success, 'could not get into specific article'
  end

  ## Testing action executing properly
end
