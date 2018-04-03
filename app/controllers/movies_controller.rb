class MoviesController < ApplicationController
  def index
    response = HTTParty.get("https://api.themoviedb.org/3/movie/now_playing?api_key=#{ENV["MOVIE_DB_API_KEY"]}&language=en-US&page=1&region=gr")
    @movies = response['results']
  end
end
