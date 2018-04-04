class Director < ApplicationRecord
  validates :name, presence: true
  validates :director_id, presence: true
  validates :imdb_page, presence: true
end
