require 'application_system_test_case'

class ArticlesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:u_1)
    post user_session_url
  end

  test 'create new article' do
    get '/'
    click_on 'New'
    fill_in 'article_id', with: 'This, is an article, therefore I write'
    fill_in 'article_text', with: 'foobar' * 5
    click_on 'Create'
    assert_equal request.fullpath, '/articles/4'
  end

  test 'vote article' do
    get 'articles/1'
    click_on 'Up vote !'
    assert(articles(:article_1).votes == 1)
  end
end
