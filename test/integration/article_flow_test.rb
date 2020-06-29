require 'test_helper'

class ArticleFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:u_1)
    post user_session_url
  end

  test 'create new article' do
    get '/articles/new'
    post '/articles', params: { article: {
      title: 'aaaaaaaaa',
      text: 'aaa' * 70, category_ids: ['']
    } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
