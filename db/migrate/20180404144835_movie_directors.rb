class MovieDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_directors do |t|
      t.belongs_to :movie
      t.belongs_to :director

      t.timestamps
    end
  end
end
