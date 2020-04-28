require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:u_1)
    votes(:one).save
    post user_session_url
  end

  # Assertions on this test case strictly change and depends on previous action.
  # Breaking it would not reflect this unless you re-write the change for the specific
  # assertion that would prove in essence, that existing votes are not being correctly
  # updated.

  test 'will update not nil vote correctly' do
    get '/articles/1'
    put article_path, params: { vote: { article_id: Article.second.id } }
    assert_not(votes(:two).positive, 'Bool should be false !')
    put article_path, params: { vote: { article_id: Article.first.id } }
    assert(votes(:one).positive, 'Bool of article one should be true')
    assert(Article.feature.first == articles(:article_2),
           'Now featured should be article two !')
  end
end
