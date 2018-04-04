class CreateDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :directors do |t|
      t.string :name, null: false
      t.integer :director_id, null: false
      t.string :imdb_page, null: false

      t.timestamps
    end
  end
end
