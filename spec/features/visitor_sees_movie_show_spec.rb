require 'rails_helper'

feature 'visitor sees movie show page' do
  scenario 'sees movie title, description, and directors' do
    star_wars = Movie.create(
      title: 'Star Wars',
      description: 'A long time ago in a galaxy far far away...',
      movie_id: 12345,
      original_title: 'Star Wars'
    )

    star_wars.directors << Director.create(
      name: 'George Lucas',
      director_id: 12345,
      imdb_page: 'http://www.imdb.com/name/nm0000184/'
    )
    
    visit movie_path(star_wars.id)

    expect(page).to have_content star_wars.title
    expect(page).to have_content star_wars.description
    expect(page).to have_link star_wars.directors[0].name
  end
end
