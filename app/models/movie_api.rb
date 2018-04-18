class MoviesApi
  class << self
    def get_movies(country)
      response = HTTParty.get("https://api.themoviedb.org/3/movie/now_playing?api_key=#{ENV["MOVIE_DB_API_KEY"]}&language=en-US&page=1&region=#{country}")
      if response.code == 200
        response['results'].each do |result|
          movie = Movie.find_or_create_by( movie_id: result['id'] )
          movie.title = result['title']
          movie.description = result['overview']
          movie.original_title = result['original_title']
          movie.image = "http://image.tmdb.org/t/p/w200#{result['poster_path']}"
          movie.updated_at = DateTime.current
          movie.save
        end
      end
    end

    def movie_directors(id)
      response = HTTParty.get("https://api.themoviedb.org/3/movie/#{id}/credits?api_key=#{ENV["MOVIE_DB_API_KEY"]}")
      if response.code == 200
        response['crew'].each do |crewmember|
          if crewmember['job'] == 'Director'
            director = Director.new(name: crewmember['name'], director_id: crewmember['id'])
            director_data = HTTParty.get("https://api.themoviedb.org/3/person/#{director.director_id}/?api_key=#{ENV["MOVIE_DB_API_KEY"]}")
            if director_data["imdb_id"]
              director.imdb_page = "http://www.imdb.com/name/#{director_data["imdb_id"]}/"
            end
            director.save
            Movie.where(movie_id: id)[0].directors << director
          end
        end
      end
    end
  end
end
