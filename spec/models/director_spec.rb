require 'rails_helper'

RSpec.describe Director, type: :model do
  let!(:director1) { Director.create(
    name: 'Guillermo del Toro',
    director_id: 10828,
    imdb_page: 'http://www.imdb.com/name/nm0868219/',
  )}

  it { should have_valid(:name).when('Steven Speilburg') }
  it { should have_valid(:director_id).when(29385) }
  it { should_not have_valid(:director_id).when(10828) }
  it { should have_valid(:imdb_page).when('http://www.imdb.com/name/nm1234567/') }
  it { should_not have_valid(:imdb_page).when('www.google.com') }
end
