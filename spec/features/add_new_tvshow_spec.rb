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

    click_on 'Sign in'
    fill_in 'email', with: 'noteeth@email.com'
    fill_in 'password', with: 'password'
    click_on 'Log in'
  end

  scenario 'user adds new show successfully' do
    visit profiles_path
    fill_in "Add tv show", with: 'Heroes'
    click_on 'Add watched show'

    expect(page).to have_content("Heroes is now in your watched list!")
    expect(page.current_path).to eq profiles_path
  end

  scenario 'user adds new adds show that is not in OMDB api, and effectively not in imdb database' do
    visit profiles_path
    fill_in "Add tv show", with: 'adfasdfafadaf'
    click_on 'Add watched show'

    expect(page).to have_content("I'm unable to find this show :( Maybe check if you typed the name correctly?")
    expect(page.current_path).to eq profiles_path
  end

  scenario 'user adds watched show that is already on their list' do
    visit profiles_path
    select '5', from: 'Rating'
    fill_in 'Add tv show', with: "Game of Thrones"
    click_on "Add watched show"

    select '5', from: 'Rating'
    fill_in 'Add tv show', with: "Game of Thrones"
    click_on "Add watched show"

    expect(page).to have_content("This show has already been added to your watched list!")
    expect(page.current_path).to eq profiles_path
  end
end
