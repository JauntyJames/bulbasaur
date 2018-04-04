require 'rails_helper'

feature 'visitor sees list of movies' do
  scenario 'sees multiple movies as links' do
    visit movies_path
    
    expect(page).to have_link Movie.last.title
    expect(page).to have_link Movie.first.title
  end

  scenario 'clicks a link and is taken to a show page' do
    visit movies_path

    click_link Movie.last.title
    expect(page).to have_content Movie.last.description
  end
end
