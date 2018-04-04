class Director < ApplicationRecord
  validates :name, presence: true
  validates :director_id, presence: true, uniqueness: true
  validates :imdb_page, presence: true, format: {
    with: /\Ahttp:\/\/www\.imdb\.com\/name\/nm\d{7}\/\z/
  }

  has_many :movie_directors
  has_many :movies, through: :movie_directors
end
