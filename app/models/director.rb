class Director < ApplicationRecord
  validates :name, presence: true
  validates :director_id, presence: true
  validates :imdb_page, presence: true

  has_many :movie_directors
  has_many :movies, through: :movie_directors
end
