require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  render_views

  let!(:movie1) { Movie.create(
    title: 'Star Wars', 
    description: 'A long time ago in a galaxy far, far away...',
    original_title: 'Star Wars',
    movie_id: 12345
  ) }

  describe 'GET#index' do
    it 'renders a view' do
      get :index
      expect( response.status ).to eq 200
      expect( response.content_type ).to eq 'text/html'
      expect( response ).to render_template 'index'
    end

    it 'returns a list of movies' do
      get :index
      expect( response.body.include?( 'Star Wars' ) ).to eq true
    end
  end

  describe 'GET#show' do
    it 'renders a view' do
      get :show, params: {id: movie1.id}
      expect( response.status ).to eq 200
      expect( response.content_type ).to eq 'text/html'
      expect( response ).to render_template 'show'
    end
  end
end
