class MoviesApi
  class << self
    def days_movies
      response = HTTParty.get("https://api.themoviedb.org/3/movie/now_playing?api_key=#{ENV["MOVIE_DB_API_KEY"]}&language=en-US&page=1&region=gr")

      if response.code == 200
        response['results'].each do |result|
          movie = Movie.create(
            title: result['title'],
            description: result['overview'],
            original_title: result['original_title'],
            movie_id: result['id']
          )
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
            director.imdb_page = "http://www.imdb.com/name/#{director_data["imdb_id"]}/"
            director.save
          end
        end
      end
    end
  end
end
