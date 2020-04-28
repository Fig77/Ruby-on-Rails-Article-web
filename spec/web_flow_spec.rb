require 'rails_helper'

RSpec.feature 'Will test flow from failed login and to create an
 account', type: :feature do
  before do
    @user1 = User.new('username' => 'foo1', 'password' => 'foobar1',
                      'email' => 'foo1@bar.com')
    categories = %w[Analysis Upcoming Reviews]
    categories.each { |x| Category.new('name' => x).save }
  end

  scenario 'Try to login, fail, create an account, and get logged afterwards.' do
    visit '/users/sign_in'
    fill_in 'user_username', with: @user1.username
    fill_in 'user_password', with: @user1.password
    click_button 'commit'
    expect(page).to have_text('Invalid Username or password.')
    click_link 'Sign up'
    fill_in 'user_username', with: @user1.username
    fill_in 'email', with: @user1.email
    fill_in 'user_password', with: @user1.password
    fill_in 'user_password_confirmation', with: @user1.password
    click_button 'Create'
    expect(page).to have_text('You have signed up successfully.')
    click_link 'Logout'
  end
end

RSpec.feature 'Will test login with valid account, create vote and downvote
an article', type: :feature do
  before do
    @user = User.create('username' => 'foo', 'password' => 'foobar',
                        'email' => 'foo@bar.com')
    categories = %w[Analysis Upcoming Reviews]
    categories.each { |x| Category.new('name' => x).save }
  end

  scenario 'Login with an already created account, create an article,
	will vote this article, after seing that working will downvoted.' do
    visit '/'
    click_link 'New'
    fill_in 'user_username', with: @user.username
    fill_in 'user_password', with: @user.password
    click_button 'commit'
    expect(page).to have_text('Signed in successfully.')
    click_link 'New'
    fill_in 'article_title', with: 'name' * 2
    fill_in 'article_text', with: 'text' * 100
    check('Upcoming')
    click_button 'Create Article'
    expect(page).to have_text('name' * 2)
    expect(page).to have_text('Votes: 0')
    click_button 'Up vote !'
    expect(page).to have_text('Votes: 1')
    click_button 'Down vote'
    expect(page).to have_text('Votes: 0')
  end
end

RSpec.feature 'Will test that articles of each category appear are they
are shown on category/1 /2 /3', type: :feature do
  before do
    @user = User.create('username' => 'foo', 'password' => 'foobar',
                        'email' => 'foo@bar.com')
    categories = %w[Reviews Analysis Upcoming]
    categories.each { |x| Category.new('name' => x).save }
    @user.articles.create('title' => 'analysi22', 'text' => 'hola' * 25, 'category_ids' => [2])
    @user.articles.create('title' => 'upcomin11', 'text' => 'hola' * 25, 'category_ids' => [3])
    @user.articles.create('title' => 'reviews33', 'text' => 'hola' * 25, 'category_ids' => [1])
  end

  scenario 'User will get to index. User will click on the category name
  on nav bar, and find articles for that category' do
    visit '/'
    within('#ulNavbar') do
      click_link 'Upcoming'
    end
    expect(page).to have_text('upcomin11')
    expect(page).to have_no_text('analysi22')
  end

  scenario 'User will create a new article, assign a category. Visit said category, and
  accessing his new article through that link' do
    visit '/'
    click_link 'Log in!'
    fill_in 'user_username', with: @user.username
    fill_in 'user_password', with: @user.password
    click_button 'commit'
    click_link 'New'
    fill_in 'article_title', with: 'name' * 2
    fill_in 'article_text', with: 'text' * 100
    check('Analysis')
    click_button 'Create Article'
    click_link 'Analysis'
    expect(page).to have_text('name' * 2)
    click_link 'name' * 2
    expect(page).to have_text('text' * 100)
  end
end
