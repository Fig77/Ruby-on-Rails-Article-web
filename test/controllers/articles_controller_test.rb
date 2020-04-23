require 'test_helper'
require 'devise'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:u_1)
    post user_session_url
  end

  test 'can get index' do
    get '/'
    assert_response :success, 'root route is not working'
  end

  test 'can get to article/id' do
    get '/articles/1'
    assert_response :success
  end

  test 'can get to article/new' do
    get '/articles/new'
    assert_response :success, 'User is logged'
  end

  test 'Index will get a hash with feature article and newest from each
  category' do
    get '/'
    index_dat = { 'feature' => articles(:article_1),
                  'new_from_categories' => [article_categories(:one),
                                            article_categories(:two)] }
    assert(@controller.instance_variable_get(:@index_data) == index_dat,
           'Index would not return the correct information.')
  end

  test 'only valid articles should be created' do
    post articles_path, params: { article: { 'title' => 'valid' * 2, 'text' => 'asd' * 25,
                                             'category_ids' => [1] } }
    assert(Category.find_by_id(1).articles.order(created_at: :desc).first.title == 'valid' * 2,
           'Article created does not exist')
    post articles_path, params: { article: { 'title' => 'NONOMRCHANG', 'text' => '',
                                             'category_ids' => [1] } }
    assert_not(Category.find_by_id(1).articles.order(created_at: :desc).first.title == 'NONOMRCHANG',
               'invalid article now exist')
  end

  test 'show will bring aparticular Article according to id in param' do
    users(:u_1).articles.new('title' => 'asdlkjsdflkjsaf',
                             'text' => 't' * 164).save
    article = users(:u_1).articles.last
    get "/articles/#{article.id}"
    assert_response :success
  end
end
