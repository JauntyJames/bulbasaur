require 'movie_api'

class MoviesController < ApplicationController
  def index
    MoviesApi.days_movies
    @movies = Movie.all
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
    MoviesApi.movie_directors(@movie.movie_id)
    @movie
  end
end
