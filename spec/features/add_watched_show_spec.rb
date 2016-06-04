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
    click_on 'Log In'
  end

  scenario 'user adds watched show successfully' do
    select '5', from: 'Rating'
    fill_in 'TV show name', with: "Game of Thrones"
    click_on "Add Show"

    expect(page).to have_content("Game Of Thrones is now in your watched list!")
    expect(page).to have_content("Game Of Thrones")
    expect(page).to have_css("img[src*='http://ia.media-imdb.com/images/M/MV5BMjM5OTQ1MTY5Nl5BMl5BanBnXkFtZTgwMjM3NzMxODE@._V1_SX300.jpg']")
    expect(page.current_path).to eq profiles_path
  end

  scenario 'user adds watched show that is already on their list' do
    select '5', from: 'Rating'
    fill_in 'TV show name', with: "Game of Thrones"
    click_on "Add Show"

    select '5', from: 'Rating'
    fill_in 'TV show name', with: "Game of Thrones"
    click_on "Add Show"

    expect(page).to have_content("This show has already been added to your watched list!")
    expect(page.current_path).to eq profiles_path
  end
end
