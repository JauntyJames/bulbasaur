class MoviesController < ApplicationController
  def index
    response = HTTParty.get("https://api.themoviedb.org/3/movie/now_playing?api_key=#{ENV["MOVIE_DB_API_KEY"]}&language=en-US&page=1&region=gr")

    response['results'].each do |result|
      movie = Movie.new(
        title: result['title'],
        description: result['overview'],
        original_title: result['original_title'],
        movie_id: result['id']
      )

      @movies = Movie.all
    end
  end
end
