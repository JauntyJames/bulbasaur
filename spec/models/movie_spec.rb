require 'rails_helper'

RSpec.describe Movie, type: :model do
  let!(:movie1) { Movie.create(
    title: 'Star Wars', 
    description: 'A long time ago in a galaxy far, far away...',
    original_title: 'Star Wars',
    movie_id: 12345
  ) }
  
  describe 'validations' do
    it{ should have_valid(:movie_id).when(12346) }
    it{ should_not have_valid(:movie_id).when(12345) }
  end
end
