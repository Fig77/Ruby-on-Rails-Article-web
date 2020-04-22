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
    assert_response :success
  end

  test 'can get to article/id' do
    get '/articles/1'
    assert_response :success
  end

  test 'can get to article/new' do
    get '/articles/new'
    assert_response :success
  end
end
