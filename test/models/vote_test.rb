class VoteTest < ActiveSupport::TestCase
  # This statements have more than one assert since are strictly related and or dependant
  # to each other. Either is the same test, same case, different object, or a result change
  # on an previusly done assert, given a change on a particular object.

  test 'Votes relationship testing: articles' do
    assert(votes(:one).article == articles(:article_1),
           'Vote does not belong to the correct article (vote one on article 1)')
    assert(votes(:three).article == articles(:article_2),
           'Vote does not belong to the correct article (vote three on article 2)')
  end

  test 'Vote relationship testing: users' do
    assert(votes(:one).user == users(:u_1),
           'Vote does not belong to the correct user (user 1, vote one)')
    assert(votes(:three).user == users(:u_1),
           'Vote does not belong to the correct user (user 1, vote three)')
  end

  test 'Vote should save its boolean status when updated' do
    votes(:one).save
    assert(votes(:one).positive, 'Should be positive after first save')
    votes(:one).save
    assert_not(votes(:one).positive, 'Should be neftaive after second save')
  end
end
