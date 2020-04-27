class VoteTest < ActiveSupport::TestCase
  test 'Votes relationship testing' do
    assert(votes(:one).article == articles(:article_1),
           'Vote does not belong to the correct article')
    assert(votes(:three).article == articles(:article_2),
           'Vote does not belong to the correct article')
    assert(votes(:one).user == users(:u_1),
           'Vote does not belong to the correct user')
    assert(votes(:three).user == users(:u_1),
           'Vote does not belong to the correct user')
  end

  test 'Vote should save its boolean status when updated' do
    votes(:one).save
    assert(votes(:one).positive, 'Should be positive after first save')
    votes(:one).save
    assert_not(votes(:one).positive, 'Should be neftaive after second save')
  end
end
