require 'rails_helper'

RSpec.feature 'from login to create to vote to index again', type: :feature do
	before do
		@user = User.create('username' => 'foo', 'password' => 'foobar',
		 'email' => 'foo@bar.com')
		@user_1 = User.new('username' => 'foo1', 'password' => 'foobar1',
		 'email' => 'foo1@bar.com')
		categories =['Analysis', 'Upcoming', 'Reviews']
		categories.each { |x| Category.new('name' => x).save}

	end

	scenario 'login-fail-signup-successfull-logout' do
		visit '/users/sign_in'
		fill_in 'user_username', with: @user_1.username
		fill_in 'user_password', with: @user_1.password
		click_button 'commit'
		expect(page).to have_text('Invalid Username or password.')
		click_link 'Sign up'
		fill_in 'user_username', with: @user_1.username
		fill_in 'email', with: @user_1.email
		fill_in 'user_password', with: @user_1.password
		fill_in 'user_password_confirmation', with: @user_1.password
		click_button 'Create'
		expect(page).to have_text('You have signed up successfully.')
		click_link 'Logout'
	end

	scenario 'login-create-vote' do
		visit '/'
		click_link 'New'
		fill_in 'user_username', with: @user.username
		fill_in 'user_password', with: @user.password
		click_button 'commit'
		expect(page).to have_text('Signed in successfully.')
		click_link 'New'
		fill_in 'article_title', with: 'name'*2
		fill_in 'article_text', with: 'text'*100
		check('Upcoming')
		click_button 'Create Article'
		expect(page).to have_text('name'*2)
		expect(page).to have_text('Votes: 0')
		click_button 'Up vote !'
		expect(page).to have_text('Votes: 1')
		click_button 'Down vote'
		expect(page).to have_text('Votes: 0')
	end
end