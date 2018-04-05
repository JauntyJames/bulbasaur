# Workable Assignment for Operations Engineer Position

## Task 1

[Task One Answers](task1.md)

[Task One Code](log_crawl.rb)

## Task 2

[Task Two Answers](task2.md)

## Task 3
### To Run:

- Clone down the repo
- `bundle install`
- Obtain an API key from [The Movie Database](https://developers.themoviedb.org/3/getting-started)
- `echo MOVIE_DB_API_KEY=your-api-key-here >> .env`
- `rake db:setup`
- `rails server`
- Navigate your browser to `localhost:3000`

### Database Schema

[Activerecord Schema File](db/schema.rb)

### Testing

- To run testing suite, run `rake spec`

### Other

- Methods for interacting with the API are found in a [custom class](app/models/movie_api.rb)
- Movie records are persisted indefinitely, but only those updated today are displayed.
