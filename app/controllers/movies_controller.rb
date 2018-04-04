require 'movie_api'

class MoviesController < ApplicationController
  def index
    MoviesApi.get_movies
    @movies = Movie.where(updated_at: Date.today.beginning_of_day..Date.today.end_of_day)
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
    unless !@movie.directors.empty?
      MoviesApi.movie_directors(@movie.movie_id)
    end
  end
end
