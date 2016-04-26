require 'rails_helper'

feature 'user goes to new show form' do
  before :each do
    FactoryGirl.create(
      :user,
      username: 't00thless',
      email: 'noteeth@email.com',
      password: 'password'
    )
    visit root_path

    click_on 'Sign In'
    fill_in 'email', with: 'noteeth@email.com'
    fill_in 'password', with: 'password'
    click_on 'Log in'
  end

  scenario 'user adds new show successfully' do
    visit new_tvshow_path
    fill_in "Name", with: 'Heroes'
    click_on 'Create Tvshow'

    expect(page).to have_content("This show doesn't exist :( Maybe check if you typed the name correctly?")
  end

  scenario 'user adds new adds show that is not in OMDB api, and effectively not in imdb database' do
    visit new_tvshow_path
    fill_in "Name", with: 'Heroes'
    click_on 'Create Tvshow'

    expect(page).to have_content("You have successfully added a show!")
    expect(page.current_path).to eq profiles_path
  end
end
