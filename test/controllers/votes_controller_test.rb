require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers
    setup do
      sign_in users(:u_1)
      votes(:one).save
      post user_session_url
    end

	test 'will update not nil vote correctly' do
		get '/articles/1'
		put article_path, params: { :article => Article.first.id }
		assert_not(votes(:two).positive, 'Bool should be false !')
		put article_path, params: { :article => Article.second.id }
		assert(votes(:one).positive, 'Bool of article one should be true')
		assert(Article.feature.first == articles(:article_2),
		 'Now featured should be article two !')
	end
end
