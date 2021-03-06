require 'movie_api'

class MoviesController < ApplicationController
  def index
    MoviesApi.get_movies('gr')
    @movies = Movie.where(updated_at: Date.current.beginning_of_day..Date.current.end_of_day).order(:title)
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
    unless !@movie.directors.empty?
      MoviesApi.movie_directors(@movie.movie_id)
    end
  end
end
