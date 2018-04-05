require 'rails_helper'

feature 'visitor sees list of movies' do
  movies = Movie.where(updated_at: Date.current.beginning_of_day..Date.current.end_of_day)
  scenario 'sees multiple movies as links' do
    visit movies_path
    
    expect(page).to have_link movies.last.title
    expect(page).to have_link movies.first.title
  end

  scenario 'clicks a link and is taken to a show page' do
    visit movies_path

    click_link movies.last.title
    expect(page).to have_content movies.last.description
  end
end
