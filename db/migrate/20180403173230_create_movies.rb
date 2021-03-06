class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :original_title, null: false
      t.integer :movie_id, null: false

      t.timestamps
    end
  end
end
