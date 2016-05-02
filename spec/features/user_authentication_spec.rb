require 'rails_helper'

feature 'User can login and logout:' do

  before :each do
    FactoryGirl.create(
      :user,
      username: 't00thless',
      email: 'noteeth@email.com',
      password: 'password'
    )
    visit root_path
  end

  scenario 'not logged-in user sees sign-up button and sign-in button' do
    expect(page).to have_link('Sign up')
    expect(page).to have_link('Sign in')
    expect(page).to_not have_link('Sign out')
  end

  scenario 'user can sign in' do
    click_on 'Sign in'
    fill_in 'email', with: 'noteeth@email.com'
    fill_in 'password', with: 'password'
    click_on 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'user can sign out' do
    click_on 'Sign in'
    fill_in 'email', with: 'noteeth@email.com'
    fill_in 'password', with: 'password'
    click_on 'Log in'
    click_on 'Sign Out'

    expect(page).to have_content("flix // chill Here's to good chillin' Sign in Sign up")
  end

  scenario "user not yet in db tries to sign in" do
    click_on 'Sign in'
    fill_in 'email', with: 'idohaveteeth@email.com'
    fill_in 'password', with: 'passwordzz'
    click_on 'Log in'

    expect(page).to have_content('Invalid email or password.')
  end

end
